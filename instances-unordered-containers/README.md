# data-default-instances-unordered-containers

[![Hackage](http://img.shields.io/hackage/v/data-default-instances-unordered-containers.svg)][data-default-instances-unordered-containers]
[![Hackage Dependencies](https://img.shields.io/hackage-deps/v/data-default-instances-unordered-containers.svg)](http://packdeps.haskellers.com/reverse/data-default-instances-unordered-containers)
[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

`Default` instances for types defined in [unordered-containers][] package:

```Haskell
instance Default (HashMap k v) where
    def = HashMap.empty

instance Default (HashSet a) where
    def = HashSet.empty
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
  "Hackage: data-default"
[data-default-class]:
  https://hackage.haskell.org/package/data-default-class
  "Hackage: data-default-class"
[data-default-instances-unordered-containers]:
  https://hackage.haskell.org/package/data-default-instances-unordered-containers
  "Package data-default-instances-unordered-containers on Hackage"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[LICENSE]:
  https://github.com/trskop/data-default-extra/blob/master/instances-unordered-containers/LICENSE
  "License of data-default-instances-unordered-containers package."
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
[unordered-containers]:
  https://hackage.haskell.org/package/unordered-containers
  "Hackage: unordered-containers"
