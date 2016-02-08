{-# LANGUAGE DeriveGeneric #-}
module Examples
  where

import GHC.Generics
import Data.Default
import Data.Default.Generic


data MyType = MyType Int (Maybe String)
  deriving (Generic, Show)

-- |
-- >>> def :: MyType
-- MyType 0 Nothing
instance Default MyType where
    def = genericDef

-- |
-- >>> def :: Foo Int (Maybe String)
-- Foo 0 Nothing
data Foo a b = Foo a b
  deriving (Generic, Show)

instance (Default a, Default b) => Default (Foo a b) where
    def = genericDef

data Bar a = Bar (Foo a MyType)
  deriving (Generic, Show)

-- |
-- >>> def :: Bar Int
-- Bar (Foo 0 (MyType 0 Nothing))
instance (Default a) => Default (Bar a) where
    def = genericDef
