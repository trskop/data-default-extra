{-# LANGUAGE CPP #-}
{-# LANGUAGE NoImplicitPrelude #-}
-- |
-- Module:       $HEADER$
-- Description:  TODO
-- Copyright:    (c) 2016, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  CPP, NoImplicitPrelude
--
-- TODO
module Data.Default
    (
    -- | 'Default' type class provides a default value of a type 'def'. In case
    -- when that type has an instance for 'Data.Monoid.Monoid', then the
    -- default value should be 'Data.Monoid.mempty', otherwise it cause a
    -- confusion.
      Default(def)
    , defOf
    )
  where

import Data.Default.Class (Default(def))
import Data.Default.Instances.Base ()
import Data.Default.Instances.Base.New ()

#ifdef WITH_bytestring
import Data.Default.Instances.ByteString ()
#endif

#ifdef WITH_case_insensitive
import Data.Default.Instances.CaseInsensitive ()
#endif

#ifdef WITH_containers
import Data.Default.Instances.Containers ()
#endif

#ifdef WITH_dlist
import Data.Default.Instances.DList ()
#endif

#ifdef WITH_old_locale
import Data.Default.Instances.OldLocale ()
#endif

#ifdef WITH_text
import Data.Default.Instances.Text ()
#endif

#ifdef WITH_unordered_containers
import Data.Default.Instances.UnorderedContainers ()
#endif

#ifdef WITH_vector
import Data.Default.Instances.Vector ()
#endif


-- | The default value for type @a@.
defOf :: Default a => proxy a -> a
defOf _proxy = def
