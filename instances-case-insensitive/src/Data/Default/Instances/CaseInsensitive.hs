{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
-- |
-- Module:       $HEADER$
-- Description:  Default instance for CI type from case-insensitive package.
-- Copyright:    (c) 2015 Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  NoImplicitPrelude
--
-- 'Default' instance for 'CI' type from
-- <https://hackage.haskell.org/package/case-insensitive case-insensitive>
-- package.
module Data.Default.Instances.CaseInsensitive
    ( -- $providedInstances
    )
  where

import Data.CaseInsensitive (CI, FoldCase)
import qualified Data.CaseInsensitive as CI (mk)

import Data.Default.Class (Default(def))


-- Another option would be to use:
--
-- instance (IsString s, FoldCase s) => Default (CI s) where
--     def = CI.mk (fromString "")
--
-- Problem with the above definition is if someone defines his/her
-- newtype with IsString instance that should have different default
-- value then "". In example hostname for connecting to, etc.

instance (Default s, FoldCase s) => Default (CI s) where
    def = CI.mk def
    {-# INLINE def #-}

-- $providedInstances
--
-- @
-- instance ('Default' s, 'FoldCase' s) => 'Default' ('CI' s) where
--     'def' = 'CI.mk' 'def'
-- @
