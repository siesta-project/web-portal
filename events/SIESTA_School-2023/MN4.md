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
(there are 3 of them, `mn1.bsc.es`, `mn2.bsc.es` and `mn3.bsc.es`).

### Via conventional SSH (Mac, Linux, Windows with WSL/Cygwin)

ssh USERNAME@mn1.bsc.es
(can also use mn2, mn3 login nodes)

In case you want to enable visualization, be sure to connect using the -X option:
ssh -X USERNAME@mn1.bsc.es


### Via Putty or mobaXterm

Set the following information in the proper fields for your interface:

server/host name: mn3.bsc.es
(can also use mn1, mn2 login nodes)

Then add your username and password when prompted.

For visualizations using putty there is two things to keep in mind:
 * Under connection -> SSH -> X11, be sure to check "Enable X11 forwarding"
 * You will also need one extra tool for visualization: [xMing](https://sourceforge.net/projects/xming/).

In mobaXterm this is enabled by default.

**IMPORTANT NOTICE**
_For visualization, we strongly encourage you to do them on your own_
_PC after copying your files (see below). Visualizations done in the_
_MareNostrum login nodes will result in ACCOUNT BANNING, but they can_
_be done in reserved nodes (see below)._


## Submitting a job

Calculations in MareNostrum need to be submitted to the queing system. For that purpose,
we will be using a job script, provided in /gpfs/projects/nct00/nct00003/RUN/runmn.sh.
Copy this script to each test folder in which you intend to run siesta.

This is an example of the contents of said script:

  #!/bin/bash
  #SBATCH -J tutorialXX
  #SBATCH -n 4
  #SBATCH -t 0:30:00
  #SBATCH -o %x-%j.out
  #SBATCH -e %x-%j.err
  #SBATCH -D .

  source /gpfs/projects/nct00/nct00003/siestarc.sh

  srun -n 4 siesta < input.fdf > output.out

Ignore the export and module lines. The "-n" options in #SBATCH and srun indicate the
amount of CPUs used. Be sure to replace "input" and "output" names accordingly, and the
name of the job specified by "#SBATCH -J".


You can submit this job script by doing:

  sbatch runmn.sh

To make use of our special reservation for the school, run sbatch with the reservation option:

  sbatch runmn.sh --reservation=SIESTA-DAY

Or:

  sbatch runmn.sh --reservation=SIESTA-NIGHT


## Making reservations and loading the school modules

For visualizations, you might need to make a node reservation instead of a job script.
When logged into MareNostrum, use the following command to make a reservation:

    salloc -t 4:00:00 -n 1 -c 1 --reservation=SIESTA-DAY -J siestaschool

This will make a 4-hour long reservation (-t option), with 1 task (-n) that uses 1 CPU (-c).
The -J option is just an identifier that you can change at will. From 21.00 to 8.00 CEST,
be sure to change SIESTA-DAY by SIESTA-NIGHT (see further below a decription on these reservations).

**DO NOT** needlessly increase the amount of CPUs, be mindful that resources are limited and must
be shared between all of the students.

Once inside this interactive session, you will be able to run Siesta and do other
calculations. Be sure to load the Siesta school module before doing anything by
doing:

    /gpfs/projects/nct00/nct00003/siestarc.sh

Beware that the module will stay active as long as your interactive session is active.
If you logout or otherwise lose conntection to the node, you must reload the module.

For more information on running jobs, visit and read
[the MareNostrum guides](https://www.bsc.es/supportkc/docs/MareNostrum4/intro).

** We encourage you to run visualizations locally on your home PC. **

## Directory with tutorials
For every practical there is a folder in the shared directory
__TBD:__ `/gpfs/projects/nct00/nct00003/TUTORIALS/` __:TBD__
that contains all the files you will need for said practical.
At the start of every tutorial, please copy the required files from that shared directory
to your home __TBD:__

    cp -r /gpfs/projects/nct00/nct00003/TUTORIALS/day1 $HOME/

__:TBD__ Please do NOT copy these files before the start of the practical, in case they are updated
shortly before the practical starts.

We encourage you to run the tutorials in the scratch folder, since home space is limited:

    cd /gpfs/scratch/nct01/USERNAME


## Backing up files

You can backup your files in case you want to keep them after the school is done. You can
do so in at least two different ways:

* Via scp/rsync (Mac, Linux, Windows with WSL/Cygwin)

scp -rp USERNAME@dt01.bsc.es:/path/to/files

(you can use any scp/rsync options freely, this is just an example)


* Via sshfs (all platforms)

This is available for all platforms, but might be specially useful
for those running exclusively windows.

Take a look at the documentation regarding sshfs at
[the BSC guides](https://www.bsc.es/supportkc/docs/dtmachines/)..


## Tools used for visualization
In case you want to run visualizations in your own PC, the following pieces of software will
be used during the school:

* [gnuplot]( http://www.gnuplot.info/ )
* [xcrysden]( http://www.xcrysden.org/ )
* [vesta]( https://jp-minerals.org/vesta/en/ )
* [vmd]( https://www.ks.uiuc.edu/Research/vmd/ )
* Python with matplotlib

If you feel brave and want to try different stuff, some tutors have strong feelings for
[ovito](https://www.ovito.org/about/).

If you are feeling a lot braver than that and want to try your own SIESTA compilation, 
have a look at
[this SIESTA compilation how-to](https://docs.siesta-project.org/projects/siesta/en/latest/how-to/installation/build-manually.html).
Be sure to have all dependencies beforehand. Note that we will not be answering questions
regarding compilation or other installations during the school.


## Additional info on SLURM Reservations
BSC has enabled two daily reservations for the duration of the school:
* `SIESTA-DAY` (between 08:00 and 21:00 (__CEST or UTC?__)): 8 MN4 nodes (48 CPU each).
* `SIESTA-NIGHT` (between 21:00 and 08:00 (__CEST or UTC?__)): 2 MN4 nodes (48 CPU each).

## Data preservation

Your accounts will be enabled on __DATE__ and will be deleted on
__DATE__  __(DATES WAITING FOR BSC INPUT)__

We strongly recommend that you perform daily backups of your BSC home to prevent the loss of any
data.

