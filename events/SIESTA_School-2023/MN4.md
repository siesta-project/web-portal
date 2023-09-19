---
layout: siesta-nav
title: "SIESTA School 2023: MareNostrum 4"
---

# SIESTA School 2023: MareNostrum 4

MareNostrum 4 is the largest operational supercomputer of the Barcelona Supercomputing Center.
Each node contains 2 Intel Xeon Platinum processors (with 24 cores each) and 96 GB of RAM.
They all run SUSE Linux 12.

## Connecting to MN4
From your computer terminal, use your SSH client to connect to a MN4 login node
(there are 3 of them, `mn1.bsc.es`, `mn2.bsc.es` and `mn3.bsc.es`)
by executing, e.g.,

    ssh <username>@mn2.bsc.es

## Loading of the school module
Before you start working on any of the tutorials,
please load the module that provides the SIESTA binary and the
rest of the tools that you will need for the school by executing (__VERSION TBD__):

    module load siesta/VERSION_TBD

__TODO: Discussion of persistence of module loads__

## Directory with tutorials
For every practical there is a folder in the shared directory
__TBD:__ `/path/to/dir` __:TBD__
that contains all the files you will need for said practical.
At the start of every tutorial, please copy the required files from that shared directory
to your home to your home __TBD:__

    cp -r /path/to/dir $HOME/

__:TBD__ Please do NOT copy these files before the start of the practical, in case they are updated
shortly before the practical starts.

## SLURM Reservations
BSC has enabled two daily reservations for the duration of the school:
* `SIESTA-DAY` (between 08:00 and 21:00 (__CEST or UTC?__)): 8 MN4 nodes.
* `SIESTA-NIGHT` (between 21:00 and 08:00 (__CEST or UTC?__)): 2 MN4 nodes.

## Data preservation

Your accounts will be enabled on __DATE__ and will be deleted on
__DATE__  __(DATES WAITING FOR BSC INPUT)__

We strongly recommend that you perform daily backups of your BSC home to prevent the loss of any
data.

