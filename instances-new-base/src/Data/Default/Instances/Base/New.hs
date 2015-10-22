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
-- Copyright:    (c) 2015, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  CPP, DataKinds (for base >=4.7.0.0), FlexibleInstances,
--               NoImplicitPrelude
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
-- instance 'Default' 'SomeNat' where
--     'def' = 'SomeSymbol' ('Proxy' :: 'Proxy' \"\")
-- @
--
-- Following instances are available only for base >= 4.8.0.0:
--
-- @
-- instance 'Default' a => 'Default' ('Identity' a) where
--     'def' = 'Identity' 'def'
--
-- instance 'Default' 'Natural' where
--     'def' = 0
-- @
--
-- This module also reexporting instances from "Data.Default.Instances.Base".
module Data.Default.Instances.Base.New
  where

import Control.Applicative (Const(Const))
import Control.Arrow (Kleisli(Kleisli))
import Control.Monad (Monad(return))

#if MIN_VERSION_base(4,7,0)
import Data.Proxy (Proxy(Proxy))
import GHC.TypeLits (SomeNat(SomeNat), SomeSymbol(SomeSymbol))
#endif

#if MIN_VERSION_base(4,8,0)
import Data.Functor.Identity (Identity(Identity))
import Data.Version (Version, makeVersion)
import Numeric.Natural (Natural)
#else
import Data.Version (Version(Version))
#endif

import Data.Default.Class (Default(def))
import Data.Default.Instances.Base ()


instance Default a => Default (Const a b) where
    def = Const def

instance Monad m => Default (Kleisli m a a) where
    def = Kleisli return

instance Default Version where
    def =
#if MIN_VERSION_base(4,8,0)
        makeVersion []
#else
        Version [] []
#endif

#if MIN_VERSION_base(4,7,0)
instance Default (Proxy a) where
    def = Proxy

instance Default SomeNat where
    def = SomeNat (Proxy :: Proxy 0)

instance Default SomeSymbol where
    def = SomeSymbol (Proxy :: Proxy "")
#endif

#if MIN_VERSION_base(4,8,0)
instance Default a => Default (Identity a) where
    def = Identity def

instance Default Natural where
    def = 0
#endif
