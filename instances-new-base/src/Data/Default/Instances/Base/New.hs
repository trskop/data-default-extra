{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

#if MIN_VERSION_base(4,7,0)
{-# LANGUAGE DataKinds #-}
#endif

-- |
-- Module:       $HEADER$
-- Description:  Default instances for types in newer versions of base package.
-- Copyright:    (c) 2015-2017 Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  GHC specific language extensions.
--
-- 'Default' instances for types in newer versions of
-- <https://hackage.haskell.org/package/base base> package.
module Data.Default.Instances.Base.New
    ( -- $providedInstances
    )
  where

import Control.Arrow (Kleisli(Kleisli))
import Control.Monad (Monad(return))

#if MIN_VERSION_base(4,7,0)
import Data.Proxy (Proxy(Proxy))
import GHC.TypeLits (SomeNat(SomeNat), SomeSymbol(SomeSymbol))
#endif

#if MIN_VERSION_base(4,8,0)
import Control.Applicative (Alternative)
import Data.Functor.Identity (Identity(Identity))
import Data.Monoid (Alt, Monoid(mempty))
import Data.Version (Version, makeVersion)
import Numeric.Natural (Natural)
#else
import Data.Version (Version(Version))
#endif

#if MIN_VERSION_base(4,9,0)
import Prelude (Bounded(maxBound, minBound))

import Data.Functor.Const
    -- Const was moved from "Control.Applicative" in to its own module.
import Data.List.NonEmpty (NonEmpty((:|)))
import Data.Maybe (Maybe(Nothing))
import Data.Semigroup
    ( Min
    , Max
    , Option(Option)
    )
#else
import Control.Applicative (Const(Const))
#endif

import Data.Default.Class (Default(def))

#if !MIN_VERSION_data_default_class(0,1,2)
import Data.Default.Instances.Base ()
#endif


-- | @'def' = 'Const' 'def'@
instance Default a => Default (Const a b) where
    def = Const def

-- | @'def' = 'Kleisli' 'return'@
instance Monad m => Default (Kleisli m a a) where
    def = Kleisli return

#if MIN_VERSION_base(4,8,0)
-- | @'def' = 'makeVersion' []@
#else
-- | @'def' = 'Version' [] []@
#endif
instance Default Version where
    def =
#if MIN_VERSION_base(4,8,0)
        makeVersion []
#else
        Version [] []
#endif

#if MIN_VERSION_base(4,7,0)
-- | @'def' = 'Proxy'@
instance Default (Proxy a) where
    def = Proxy

-- | @'def' = 'SomeNat' ('Proxy' :: 'Proxy' 0)@
instance Default SomeNat where
    def = SomeNat (Proxy :: Proxy 0)

-- | @'def' = 'SomeSymbol' ('Proxy' :: 'Proxy' \"\")@
instance Default SomeSymbol where
    def = SomeSymbol (Proxy :: Proxy "")
#endif

#if MIN_VERSION_base(4,8,0)
-- | @'def' = 'mempty'@
instance Alternative f => Default (Alt f a) where
    def = mempty

-- | @'def' = 'Identity' 'def'@
instance Default a => Default (Identity a) where
    def = Identity def

-- | @'def' = 0@
instance Default Natural where
    def = 0
#endif

#if MIN_VERSION_base(4,9,0)
-- | @'def' = 'def' ':|' []@
instance Default a => Default (NonEmpty a) where
    def = def :| []

-- | @'def' = 'minBound'@
instance Bounded a => Default (Min a) where
    def = minBound

-- | @'def' = 'maxBound'@
instance Bounded a => Default (Max a) where
    def = maxBound

-- | @'def' = 'Option' 'Nothing'@
instance Default (Option a) where
    def = Option Nothing
#endif

-- $providedInstances
--
-- Following 'Default' instances are provided:
--
-- @
-- instance 'Default' a => 'Default' ('Const' a b) where
--     'def' = 'Const' 'def'
--
-- instance 'Monad' m => 'Default' ('Kleisli' m a b) where
--     'def' = 'Kleisli' 'return'
--
-- instance 'Default' 'Version' where
--     'def' = 'Version' [] []
-- @
--
-- Following instances are available only for base >= 4.7.0.0:
--
-- @
-- instance 'Default' ('Proxy' a) where
--     'def' = 'Proxy'
--
-- instance 'Default' 'SomeNat' where
--     'def' = 'SomeNat' ('Proxy' :: 'Proxy' 0)
--
-- instance 'Default' 'SomeSymbol' where
--     'def' = 'SomeSymbol' ('Proxy' :: 'Proxy' \"\")
-- @
--
-- Following instances are available only for base >= 4.8.0.0:
--
-- @
-- instance 'Alternative' f => 'Default' ('Alt' f a) where
--     'def' = 'Data.Monoid.Alt' 'Control.Applicative.empty'
--
-- instance 'Default' a => 'Default' ('Identity' a) where
--     'def' = 'Identity' 'def'
--
-- instance 'Default' 'Natural' where
--     'def' = 0
-- @
--
-- Following instances are available only for base >= 4.9.0.0:
--
-- @
-- instance 'Default' a => 'Default' ('NonEmpty' a) where
--     'def' = 'def' ':|' []
--
-- instance 'Bounded' a => 'Default' ('Min' a) where
--     'def' = 'minBound'
--
-- instance 'Bounded' a => 'Default' ('Max' a) where
--     'def' = maxBound
--
-- instance 'Default' ('Option' a) where
--     'def' = 'Option' 'Nothing'
-- @
--
-- This module also reexporting instances from "Data.Default.Instances.Base".
