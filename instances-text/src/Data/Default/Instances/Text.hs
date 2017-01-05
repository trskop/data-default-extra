{-# LANGUAGE CPP #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
-- |
-- Module:       $HEADER$
-- Description:  Default instances for (strict and lazy) Text and Text Builder.
-- Copyright:    (c) 2016 Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  CPP, NoImplicitPrelude
--
-- 'Default' instances for (strict) 'Strict.Text', (lazy) 'Lazy.Text' and
-- 'Builder' from
-- <https://hackage.haskell.org/package/text text> package.
module Data.Default.Instances.Text
    ( -- $providedInstances
    )
  where

import Data.Monoid (Monoid(mempty))

import qualified Data.Text as Strict (Text)
import qualified Data.Text as Strict.Text (empty)
import qualified Data.Text.Lazy as Lazy (Text)
import qualified Data.Text.Lazy as Lazy.Text (empty)

#if MIN_VERSION_text(0,8,0)
-- Version 0.8.0.0 is the first that introduced Builder.
import Data.Text.Lazy.Builder (Builder)
#endif

import Data.Default.Class (Default(def))


-- | @'def' = 'Strict.Text.empty'@
instance Default Strict.Text where
    def = Strict.Text.empty
    {-# INLINE def #-}

-- | @'def' = 'Lazy.Text.empty'@
instance Default Lazy.Text where
    def = Lazy.Text.empty
    {-# INLINE def #-}

#if MIN_VERSION_text(0,8,0)
-- Version 0.8.0.0 is the first that introduced Builder.

-- | @'def' = 'mempty'@
instance Default Builder where
    -- Using mempty implies that we need dependency on base, other option would
    -- be to depend on internal module of text package. Considering the first
    -- option to be the lesser of two evils.
    def = mempty
    {-# INLINE def #-}
#endif


-- $providedInstances
--
-- Following instances are provided:
--
-- @
-- -- Strict Text:
-- instance 'Default' 'Strict.Text' where
--     'def' = 'Strict.Text.empty'
--
-- -- Lazy Text:
-- instance 'Default' 'Lazy.Text' where
--     'def' = 'Lazy.Text.empty'
-- @
--
-- Following instances are provided only for
-- <https://hackage.haskell.org/package/text text> >=0.8, since that it the
-- version that introduced 'Builder':
--
-- @
-- instance 'Default' 'Builder' where
--     'def' = 'mempty'
-- @
