Cabal file format changelog
===========================

==================================================
 Package Description Format Specification History
==================================================

:ref:`pkg-desc` need to specify the version of the
specification they need to be interpreted in via the
:pkg-field:`cabal-version` declaration. The following list describes
changes that occurred in each version of the cabal specification
relative to the respective preceding *published* version.

.. note::

    The sequence of specification version numbers is *not*
    contiguous because it's synchronised with the version of the
    ``Cabal`` library. As a consequence, only *even* versions are
    considered proper published versions of the specification as *odd*
    versions of the ``Cabal`` library denote unreleased development
    branches which have no stability guarantee.

``cabal-version: 2.5``
----------------------

* Added the `extra-dynamic-library-flavours` field to specify non-trivial
  variants of dynamic flavours. It is `extra-library-flavours` but for
  shared libraries. Mainly useful for GHC's RTS library.

``cabal-version: 2.4``
----------------------

* Wildcard matching has been expanded. All previous wildcard
  expressions are still valid; some will match strictly more files
  than before. Specifically:

  * Double-star (``**``) wildcards are now accepted for recursive
    matching immediately before the final slash; they must be followed
    by a filename wildcard (e.g., ``foo/**/*.html`` is valid;
    ``foo/**/bar/*.html`` and ``foo/**/**/*.html``,
    ``foo/**/bar.html`` are all invalid). As ``**`` was an error in
    globs before, this does not affect any existing ``.cabal`` files
    that previously worked.

  * Wildcards now match when the pattern's extensions form a suffix of
    the candidate file's extension, rather than requiring strict
    equality (e.g., previously ``*.html`` did not match
    ``foo.en.html``, but now it does).
