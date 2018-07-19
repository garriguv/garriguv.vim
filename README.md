# vim

## Installation

    make install

## Packages

For more information, check out this [blog post](https://shapeshed.com/vim-packages/).

### Add a package

    git submodule add git@github.com:<package>.git pack/garriguv/start/<package>

### Update packages

    make update

or

    git submodule update --remote --merge

### Remove a package

    git submodule deinit pack/garriguv/start/<package>
    git rm pack/garriguv/start/<package>
    rm -rf .git/modules/pack/garriguv/start/<package>

### Package documentation

After installing or updating a package, make sure to re-generate the
documentation using:

    :helptags ALL
