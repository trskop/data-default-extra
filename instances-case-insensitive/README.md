# data-default-instances-case-insensitive

[![Hackage](http://img.shields.io/hackage/v/data-default-instances-case-insensitive.svg)][data-default-instances-case-insensitive]
[![Hackage Dependencies](https://img.shields.io/hackage-deps/v/data-default-instances-case-insensitive.svg)](http://packdeps.haskellers.com/reverse/data-default-instances-case-insensitive)
[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

`Default` instance for `CI` type from [case-insensitive][] package:

```Haskell
instance (Default s, FoldCase s) => Default (CI s) where
    def = CI.mk def
```

This package is intended to be used in conjunction with [data-default][]
package or directly with [data-default-class][] package.


## License

The BSD 3-Clause License, see [LICENSE][] file for details.


## Contributions

Contributions, pull requests and bug reports are welcome! Please don't be
afraid to contact author using GitHub or by e-mail.



[case-insensitive]:
  https://hackage.haskell.org/package/case-insensitive
  "The case-insensitive package on Hackage"
[data-default]:
  https://hackage.haskell.org/package/data-default
  "Package data-default on Hackage"
[data-default-class]:
  https://hackage.haskell.org/package/data-default-class
  "Package data-default-class on Hackage"
[data-default-instances-case-insensitive]:
  https://hackage.haskell.org/package/data-default-instances-case-insensitive
  "Package data-default-instances-case-insensitive on Hackage"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[LICENSE]:
  https://github.com/trskop/data-default-extra/blob/master/instances-case-insensitive/LICENSE
  "License of data-default-instances-case-insensitive package."
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
