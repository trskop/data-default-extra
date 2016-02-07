# data-default-instances-bytestring

[![Hackage](http://img.shields.io/hackage/v/data-default-instances-bytestring.svg)][data-default-instances-bytestring]
[![Hackage Dependencies](https://img.shields.io/hackage-deps/v/data-default-instances-bytestring.svg)](http://packdeps.haskellers.com/reverse/data-default-instances-bytestring)
[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

`Default` instances for types defined in [bytestring][] package:

```Haskell
instance Default Strict.ByteString where
    def = Strict.ByteString.empty

instance Default Lazy.ByteString where
    def = Lazy.ByteString.empty

-- For bytestring >=0.10.
instance Default Builder where
    def = mempty

-- For bytestring >=0.10.4.
instance Default ShortByteString where
    def = ShortByteString.empty
```

This package is intended to be used in conjunction with [data-default][]
package or directly with [data-default-class][] package.


## License

The BSD 3-Clause License, see [LICENSE][] file for details.


## Contributions

Contributions, pull requests and bug reports are welcome! Please don't be
afraid to contact author using GitHub or by e-mail.


[bytestring]:
  https://hackage.haskell.org/package/bytestring
  "Package bytestring on Hackage"
[data-default]:
  https://hackage.haskell.org/package/data-default
  "Package data-default on Hackage"
[data-default-class]:
  https://hackage.haskell.org/package/data-default-class
  "Package data-default-class on Hackage"
[data-default-instances-bytestring]:
  https://hackage.haskell.org/package/data-default-instances-bytestring
  "Package data-default-instances-bytestring on Hackage"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[LICENSE]:
  https://github.com/trskop/data-default-extra/blob/master/instances-bytestring/LICENSE
  "License of data-default-instances-bytestring package."
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
