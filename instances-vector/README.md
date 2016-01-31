# data-default-instances-vector

[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

Default instances for types in [vector][] package:

```Haskell
instance Default (Vector a) where
    def = empty

instance Storable a => Default (Storable.Vector a) where
    def = Storable.empty

instance Unbox a => Default (Unboxed.Vector a) where
    def = Unboxed.empty
```

This package is intended to be used in conjunction with [data-default][]
package or directly with [data-default-class][] package.


## License

The BSD 3-Clause License, see [LICENSE][] file for details.


## Contributions

Contributions, pull requests and bug reports are welcome! Please don't be
afraid to contact author using GitHub or by e-mail.


[data-default]:
  https://hackage.haskell.org/package/data-default
  "Package data-default on Hackage"
[data-default-class]:
  https://hackage.haskell.org/package/data-default-class
  "Package data-default-class on Hackage"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[LICENSE]:
  https://github.com/trskop/data-default-extra/blob/master/instances-vector/LICENSE
  "License of data-default-instances-vector package."
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
[vector]:
  https://hackage.haskell.org/package/vector
  "Package vector on Hackage"
