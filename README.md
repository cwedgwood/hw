hw
==

preface
-------

this is an example of a (very) small container

the intent is actually to test build infrastructure & automation, by
itself you'll find it's not very interesting

usage
-----

hw32 & hw64 say "hello world!"

there is also hwx32 though it's not put into the container by default
as not all kernels support this

bored?
------

the container *could* be smaller by omitting hw64

the minimum size (on disk and in-core) for a single file is typically
4k - so i might add functionality in the future up to that limit
