{-# LANGUAGE CPP #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
-- |
-- Module:       $HEADER$
-- Description:  Default instances for (strict and lazy) ByteString and
--               ByteString Builder.
-- Copyright:    (c) 2016, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  CPP, NoImplicitPrelude
--
-- 'Default' instances for (strict) 'Strict.ByteString', (lazy)
-- 'Lazy.ByteString' and 'Builder' from
-- <https://hackage.haskell.org/package/bytestring bytestring> package.
module Data.Default.Instances.ByteString
    ( -- $providedInstances
    )
  where

import Data.Monoid (Monoid(mempty))

import qualified Data.ByteString as Strict (ByteString)
import qualified Data.ByteString as Strict.ByteString (empty)
import qualified Data.ByteString.Lazy as Lazy (ByteString)
import qualified Data.ByteString.Lazy as Lazy.ByteString (empty)

#if MIN_VERSION_bytestring(0,10,2)
-- Builder moved from Data.ByteString.Lazy.Builder to Data.ByteString.Builder
-- module in version 0.10.2.0.
import Data.ByteString.Builder (Builder)
#elif MIN_VERSION_bytestring(0,10,0)
import Data.ByteString.Lazy.Builder (Builder)
#endif

#if MIN_VERSION_bytestring(0,10,4)
import Data.ByteString.Short (ShortByteString)
import qualified Data.ByteString.Short as ShortByteString (empty)
#endif

import Data.Default.Class (Default(def))


-- | @'def' = 'Strict.ByteString.empty'@
instance Default Strict.ByteString where
    def = Strict.ByteString.empty
    {-# INLINE def #-}

-- | @'def' = 'Lazy.ByteString.empty'@
instance Default Lazy.ByteString where
    def = Lazy.ByteString.empty
    {-# INLINE def #-}

#if MIN_VERSION_bytestring(0,10,0)
-- Version 0.10.0.0 is the first that introduced Builder.

-- | @'def' = 'mempty'@
instance Default Builder where
    -- Using mempty implies that we need dependency on base, other option would
    -- be to depend on internal module of bytestring package. Considering the
    -- first option to be the lesser of two evils.
    def = mempty
    {-# INLINE def #-}
#endif

#if MIN_VERSION_bytestring(0,10,4)
-- Version 0.10.4.0 is the first that introduced ShortByteString.

-- | @'def' = 'ShortByteString.empty'@
instance Default ShortByteString where
    def = ShortByteString.empty
    {-# INLINE def #-}
#endif


-- $providedInstances
--
-- Following instances are provided:
--
-- @
-- -- Strict ByteString:
-- instance 'Default' 'Strict.ByteString' where
--     'def' = 'Strict.ByteString.empty'
--
-- -- Lazy ByteString:
-- instance 'Default' 'Lazy.ByteString' where
--     'def' = 'Lazy.ByteString.empty'
-- @
--
-- Following instance is provided only for
-- <https://hackage.haskell.org/package/bytestring bytestring> >=0.10, since
-- that it the version that introduced 'Builder':
--
-- @
-- instance 'Default' 'Builder' where
--     'def' = 'mempty'
-- @
--
-- Following instance is provided only for
-- <https://hackage.haskell.org/package/bytestring bytestring> >=0.10.4, since
-- that it the version that introduced 'ShortByteString':
--
-- @
-- instance 'Default' 'ShortByteString' where
--     'def' = 'ShortByteString.empty'
-- @
