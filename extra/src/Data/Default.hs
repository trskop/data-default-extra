{-# LANGUAGE CPP #-}
{-# LANGUAGE NoImplicitPrelude #-}
-- |
-- Module:       $HEADER$
-- Description:  A class for types with a default value.
-- Copyright:    (c) 2016, Peter Trško
-- License:      BSD3
--
-- Maintainer:   peter.trsko@gmail.com
-- Stability:    stable
-- Portability:  CPP, NoImplicitPrelude
--
-- A class for types with a default value.
module Data.Default
    (
    -- | 'Default' type class provides a default value ('def') of a type. In
    -- case when a particluar type has an instance for 'Data.Monoid.Monoid',
    -- then the default value should be 'Data.Monoid.mempty', otherwise it can
    -- cause a great deal of confusion.
    --
    -- One must understand, that 'Default' type class, has no axioms associated
    -- with it. Its purpose is to minimize:
    --
    -- * Number of imports.
    --
    -- * Number of introduced definitions that are part of an API.
    --
    -- * Complexity of building more complicated \"default values\" out of
    --   simpler \"default values\".
    --
    -- * Cognitive overhead. (Reduction of cognitive overhead is partially a
    --   consequence of reducing above issues.)
    --
    -- As one may notice, most of the listed problems, that 'Default' type
    -- class tries to solve, to various degrees of success, are for human
    -- benefit, and not theoretically founded. Because of this, please always
    -- try hard to define sensible instances of 'Default'. Most importantly,
    -- document what 'def' means for particular type, and always check that
    -- 'def' is sensible, by testing it on a real world sample of human beings,
    -- one is not a big enough sample.
    --
    -- That said, using 'Default' may not always be a good idea. If it breaks
    -- people's mental models, or theoretical models with real axioms, then just
    -- don't use it.
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
