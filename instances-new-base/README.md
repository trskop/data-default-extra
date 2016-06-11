# data-default-instances-new-base

[![Hackage](http://img.shields.io/hackage/v/data-default-instances-new-base.svg)][data-default-instances-new-base]
[![Hackage Dependencies](https://img.shields.io/hackage-deps/v/data-default-instances-new-base.svg)](http://packdeps.haskellers.com/reverse/data-default-instances-new-base)
[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

Orphan instances for `Default` type class, which is defined in package
[data-default-class][].

In addition to instances reexported from [data-default-instances-base][]
package, following `Default` instances are provided:

```Haskell
instance Default a => Default (Const a b) where
    def = Const def

instance Monad m => Default (Kleisli m a b) where
    def = Kleisli return

instance Default Version where
    def = Version [] []
```

Following instances are available only for [base][] >= 4.7.0.0:

```Haskell
instance Default (Proxy a) where
    def = Proxy

instance Default SomeNat where
    def = SomeNat (Proxy :: Proxy 0)

instance Default SomeSymbol where
    def = SomeSymbol (Proxy :: Proxy "")
```

Following instances are available only for [base][] >= 4.8.0.0:

```Haskell
instance Alternative f => Default (Alt f a) where
    def = Alt empty

instance Default a => Default (Identity a) where
    def = Identity def

instance Default Natural where
    def = 0
```

Following instances are available only for [base][] >= 4.9.0.0:

```Haskell
instance Default a => Default (NonEmpty a) where
    def = def :| []

instance 'Bounded' a => Default (Min a) where
    def = minBound

instance Bounded a => Default (Max a) where
    def = maxBound

instance 'Default' ('Option' a) where
    def = Option Nothing
```

This package is intended to be used in conjunction with [data-default][]
package or directly with [data-default-class][] package.


## License

The BSD 3-Clause License, see [LICENSE][] file for details.


## Contributions

Contributions, pull requests and bug reports are welcome! Please don't be
afraid to contact author using GitHub or by e-mail.


[base]:
  https://hackage.haskell.org/package/base
  "Package base on Hackage"
[data-default]:
  https://hackage.haskell.org/package/data-default
  "Package data-default on Hackage"
[data-default-class]:
  https://hackage.haskell.org/package/data-default-class
  "Package data-default-class on Hackage"
[data-default-instances-base]:
  https://hackage.haskell.org/package/data-default-instances-base
  "Package data-default-instances-base on Hackage"
[data-default-instances-new-base]:
  https://hackage.haskell.org/package/data-default-instances-new-base
  "Package data-default-instances-new-base on Hackage"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[LICENSE]:
  https://github.com/trskop/data-default-extra/blob/master/instances-new-base/LICENSE
  "License of data-default-instances-new-base package."
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
