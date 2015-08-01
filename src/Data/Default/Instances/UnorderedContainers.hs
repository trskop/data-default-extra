{-# LANGUAGE NoImplicitPrelude #-}
-- |
-- Module:       $HEADER$
-- Description:  Default instances for strict and lazy HashMap, and HashSet.
-- Copyright:    (c) 2015, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    experimental
-- Portability:  NoImplicitPrelude
--
-- 'Default' instances for strict 'Strict.HashMap', lazy 'Lazy.HashMap', and
-- 'HashSet'.
module Data.Default.Instances.UnorderedContainers ()
  where

import Data.HashMap.Lazy as Lazy (HashMap)
import qualified Data.HashMap.Lazy as Lazy.HashMap (empty)
import Data.HashMap.Strict as Strict (HashMap)
import qualified Data.HashMap.Strict as Strict.HashMap (empty)
import Data.HashSet (HashSet)
import qualified Data.HashSet as HashSet (empty)

import Data.Default.Class (Default(def))


instance Default (Lazy.HashMap k v) where
    def = Lazy.HashMap.empty

instance Default (Strict.HashMap k v) where
    def = Strict.HashMap.empty

instance Default (HashSet k v) where
    def = HashSet.empty
