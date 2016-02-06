# data-default-extra

[![Haskell Programming Language](https://img.shields.io/badge/language-Haskell-blue.svg)][Haskell.org]
[![BSD3 License](http://img.shields.io/badge/license-BSD3-brightgreen.svg)][tl;dr Legal: BSD3]

[![Build](https://travis-ci.org/trskop/data-default-extra.svg)](https://travis-ci.org/trskop/data-default-extra)


# Description

An alternative to [data-default][] package, that provides a lot of additional
instances for `Default` type class.

`Default` type class provides a default value (`def`) of a type. In case when a
particluar type has an instance for `Monoid`, then the default value, for the
same type, should be `mempty`, otherwise it can cause a great deal of
confusion.

One must understand, that `Default` type class, has no axioms associated with
it. Its purpose is to minimize:

* Number of imports.

* Number of introduced definitions that are part of an API.

* Complexity of building more complicated "default values" out of
  simpler "default values".

* Cognitive overhead. (Reduction of cognitive overhead is partially a
  consequence of reducing above issues.)

As one may notice, most of the listed problems, that `Default` type
class tries to solve, to various degrees of success, are for human
benefit, and not theoretically founded. Because of this, please always
try hard to define sensible instances of `Default`. Most importantly
document what `def` means for particular type, and always check that
`def` is sensible, by testing it on a real world sample of human beings,
one is not a big enough sample.

That said, using `Default` may not be always good idea. If it breaks
peoples mental model, or theoretical models with real axioms, then just
don't use it.

This package, in most part, just reexports a set of packages that provide additional instances for [data-default-class][] package.


## License

The BSD 3-Clause License, see [LICENSE][] file for details.


## Contributions

Contributions, pull requests and bug reports are welcome! Please don't be
afraid to contact author using GitHub or by e-mail.


[data-default]:
  https://hackage.haskell.org/package/data-default
  "Hackage: data-default"
[Haskell.org]:
  http://www.haskell.org
  "The Haskell Programming Language"
[LICENSE]:
  https://github.com/trskop/data-default-extra/blob/master/extra/LICENSE
  "License of data-default-extra package."
[tl;dr Legal: BSD3]:
  https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29
  "BSD 3-Clause License (Revised)"
