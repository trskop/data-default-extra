{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TypeOperators #-}
-- |
-- Module:       $HEADER$
-- Description:  Create Default instances using GHC Generics.
-- Copyright:    (c) 2016-2017 Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  GHC specific language extension.
--
-- __DEPRECATED__ because package
-- <https://hackage.haskell.org/package/data-default-class data-default-class>
-- now supports GHC Generics.
--
-- Create 'Default' instances using GHC Generics. For more information see:
--
-- * <https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/ GHC User's Guide>
--
-- * <https://wiki.haskell.org/GHC.Generics HaskellWiki: GHC.Generics>
--
-- Package
-- <https://hackage.haskell.org/package/data-default-class data-default-class>
-- supports GHC Generics since version 0.1.0, but it is still useful to have
-- 'GDefault' and 'genericDef' exposed for more complex cases.
module Data.Default.Generic
     {-# DEPRECATED "Use DefaultSignatures or DeriveAnyClass language extension instead." #-}
    (
    -- | Rule of thumb, if generic instance definition, contains more code then
    -- the explicit definition, then use the explicit definition.
    --
    -- Note, that sum types aren't supported, but even if they were, it is
    -- always better to explicitly specify 'Default' instance for sum types.
    --
    -- Usage example:
    --
    -- @
    -- {-\# LANGUAGE DeriveGeneric \#-}
    --
    -- import GHC.Generics (Generic)
    --
    --
    -- data MyType = MyType Int (Maybe String)
    --   deriving (Generic, Show)
    --
    -- instance 'Default' MyType where
    --     'def' = 'genericDef'
    -- @
    --
    -- >>> def :: MyType
    -- MyType 0 Nothing
      genericDef
    , GDefault(gdef)
    )
  where

import GHC.Generics
    ( Generic
    , (:*:)((:*:))
    , K1(K1)
    , M1(M1)
    , Rep
    , U1(U1)
    , to
    )

import Data.Default.Class (Default(def))


-- | Derive implementation of 'def' by using GHC Generics.
genericDef :: (Generic a, GDefault (Rep a)) => a
genericDef = to gdef

-- | Simple derivation of 'def' definition that handles only product types, but
-- not sum types. In case of sum types it is better to provide hand written
-- instances for 'Default'.
class GDefault f where
    gdef :: f a

instance GDefault U1 where
    gdef = U1

instance Default a => GDefault (K1 i a) where
    gdef = K1 def

instance GDefault a => GDefault (M1 i c a) where
    gdef = M1 gdef

instance (GDefault a, GDefault b) => GDefault (a :*: b) where
    gdef = gdef :*: gdef
