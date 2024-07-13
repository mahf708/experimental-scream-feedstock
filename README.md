About pyscream-feedstock
========================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/experimental-scream-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/E3SM-Project/scream

Package license: 

Summary: Python wrapper for EAMxx

Current build status
====================


<table>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-pyscream-green.svg)](https://anaconda.org/mahf708/pyscream) | [![Conda Downloads](https://img.shields.io/conda/dn/mahf708/pyscream.svg)](https://anaconda.org/mahf708/pyscream) | [![Conda Version](https://img.shields.io/conda/vn/mahf708/pyscream.svg)](https://anaconda.org/mahf708/pyscream) | [![Conda Platforms](https://img.shields.io/conda/pn/mahf708/pyscream.svg)](https://anaconda.org/mahf708/pyscream) |

Installing pyscream
===================

Installing `pyscream` from the `mahf708` channel can be achieved by adding `mahf708` to your channels with:

```
conda config --add channels mahf708
conda config --set channel_priority strict
```

Once the `mahf708` channel has been enabled, `pyscream` can be installed with `conda`:

```
conda install pyscream
```

or with `mamba`:

```
mamba install pyscream
```

It is possible to list all of the versions of `pyscream` available on your platform with `conda`:

```
conda search pyscream --channel mahf708
```

or with `mamba`:

```
mamba search pyscream --channel mahf708
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search pyscream --channel mahf708

# List packages depending on `pyscream`:
mamba repoquery whoneeds pyscream --channel mahf708

# List dependencies of `pyscream`:
mamba repoquery depends pyscream --channel mahf708
```




Updating pyscream-feedstock
===========================

If you would like to improve the pyscream recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`mahf708` channel, whereupon the built conda packages will be available for
everybody to install and use from the `mahf708` channel.
Note that all branches in the conda-forge/pyscream-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@scream-team](https://github.com/scream-team/)

