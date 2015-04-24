

Writing software which must run without an OS is interesting.
Having no basic functionality and no predefined functions makes you get as
close to the metal as possible.

Thus this layer of software is called "bare metal"

There are several things which you have to take care of when writing
software like this.

1. System isn't in reset. This doesn't mean processor itself, but mainly
peripherals which you're going to use.

2. System has a proper clocking.

3. You start with an idea of visibility. It can either be an access to LED,
or an access to the memory, if you have hardware debugger.


