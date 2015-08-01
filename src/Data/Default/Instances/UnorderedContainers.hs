{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
-- |
-- Module:       $HEADER$
-- Description:  Default instances for HashMap and HashSet.
-- Copyright:    (c) 2015, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    experimental
-- Portability:  NoImplicitPrelude
--
-- 'Default' instances for 'HashMap' and 'HashSet'.
module Data.Default.Instances.UnorderedContainers ()
  where

import qualified Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HashMap (empty)
import Data.HashSet (HashSet)
import qualified Data.HashSet as HashSet (empty)

import Data.Default.Class (Default(def))


instance Default (HashMap k v) where
    def = HashMap.empty

instance Default (HashSet a) where
    def = HashSet.empty
