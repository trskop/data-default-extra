{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
-- |
-- Module:       $HEADER$
-- Description:  Default instances for types vector package.
-- Copyright:    (c) 2015, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  NoImplicitPrelude
--
-- 'Default' instances for types
-- <https://hackage.haskell.org/package/vector vector> package.
module Data.Default.Instances.Vector
    ( -- $providedInstances
    )
  where

import Data.Vector (Vector, empty)
import Data.Vector.Unboxed (Unbox)
import qualified Data.Vector.Unboxed as Unboxed (Vector, empty)
import Data.Vector.Storable (Storable)
import qualified Data.Vector.Storable as Storable (Vector, empty)

import Data.Default.Class (Default(def))


-- All "empty" functions we import from Vector are actually implemented using
-- the same generic function, but using it like this provides us with more
-- robust code.

instance Default (Vector a) where
    def = empty
    {-# INLINE def #-}
    -- Function empty is also inlined and we need to preserve low-level
    -- optimizations that are done in vector package.

instance Storable a => Default (Storable.Vector a) where
    def = Storable.empty
    {-# INLINE def #-}
    -- Function Storable.empty is also inlined and we need to preserve
    -- low-level optimizations that are done in vector package.

instance Unbox a => Default (Unboxed.Vector a) where
    def = Unboxed.empty
    {-# INLINE def #-}
    -- Function Unboxed.empty is also inlined and we need to preserve low-level
    -- optimizations that are done in vector package.

-- $providedInstances
--
-- @
-- instance 'Default' ('Vector' a) where
--     'def' = 'empty'
--
-- instance 'Storable' a => 'Default' ('Storable.Vector' a) where
--     'def' = 'Storable.empty'
--
-- instance 'Unbox' a => 'Default' ('Unboxed.Vector' a) where
--     'def' = 'Unboxed.empty'
-- @
