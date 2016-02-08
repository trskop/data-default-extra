{-# LANGUAGE DeriveGeneric #-}
module Examples
  where

import GHC.Generics
import Data.Default.Class
import Data.Default.Generic


data MyType = MyType Int (Maybe String)

-- |
-- >>> def :: MyType
-- MyType 0 Nothing
instance Default MyType where
    def = genericDef

-- |
-- >>> def :: Foo Int (Maybe String)
-- Foo 0 Nothing
data Foo a b = Foo a b
  deriving Generic

instance (Default a, Default b) => Default (Foo a b) where
    def = genericDef
