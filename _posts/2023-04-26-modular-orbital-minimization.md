---
layout: post
title: "Modular linear- and cubic-scaling orbital minimization methods"
date: 2023-04-26
---

SIESTA was originally designed to support simulations that scale linearly with the number of atoms,
but in practice the linearly-scaling solvers have not been widely used:
most calculations so far have used the default cubic-scaling solvers.

We have recently implemented an improved, more reliable version of linear-scaling
solvers in SIESTA, as reported in the following open-access publication:

Irina V. Lebedeva, Alberto García, Emilio Artacho, and Pablo Ordejón:
***Modular implementation of the linear- and cubic-scaling orbital minimization methods
in electronic structure codes using atomic orbitals***,
[Royal Society Open Science **10**, 230063 (2023)](https://doi.org/10.1098/rsos.230063)
![Open Access logo]({{ site.baseurl }}/assets/img/open_access_logo.svg){: style="height:1em"}.]

In particular, this work is based on the [libOMM](https://esl.cecam.org/software/libomm/)
library, which implements
orbital minimization methods (OMM) -- 
unconstrained minimization methods of suitable energy functionals --
as part of the Electronic Structure Library ([ESL](https://esl.cecam.org/)).
We have created and integrated into SIESTA an interface to libOMM, and we have
added linear-scaling solvers to libOMM, which already provided cubic-scaling solvers.
This also involved improvements to the [MatrixSwitch](https://esl.cecam.org/software/matrixswitch/)
library used by libOMM. MatrixSwitch ultimately
leverages the [ScaLAPACK](http://www.netlib.org/scalapack)
and [DBCSR](https://www.cp2k.org/dbcsr) libraries for linear algebra methods
with dense and sparse matrices, respectively.

This modularization is yet another step towards making SIESTA more sustainable
from the software engineering point of view.
More importantly, this work will underpin future efficient simulations of larger atomistic systems
thanks to the improved linear-scaling methods, thus increasing the breadth of the applications of SIESTA.

This new functionality is scheduled to become available in SIESTA as part of the 6.0 release.
A preview is already available on the rel-MaX-2 showcase branch, for more information see
the [Guide to SIESTA versions](https://gitlab.com/siesta-project/siesta/-/wikis/Guide-to-Siesta-versions).

