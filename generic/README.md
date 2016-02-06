# data-default-generic

[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

Create `Default` instances using [GHC Generics][].

Usage example:

```Haskell
data MyType = MyType Int (Maybe String)

instance Default MyType where
    def = genericDef
```

```
λ> def :: MyType
MyType 0 Nothing
```


[GHC Generics]:
  https://wiki.haskell.org/GHC.Generics
  "GHC.Generics on HaskellWiki"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
