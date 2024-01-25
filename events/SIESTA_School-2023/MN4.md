---
layout: siesta-nav
title: "SIESTA School 2023: MareNostrum 4"
---

# SIESTA School 2023: MareNostrum 4

MareNostrum 4 is the largest operational supercomputer of the Barcelona Supercomputing Center.
Each node contains 2 Intel Xeon Platinum processors (with 24 cores each) and 96 GB of RAM.
They all run SUSE Linux 12.

You should have received your BSC credentials in your institutional email account
on September 30th. Your BSC account is already enabled.
Please contact the organisers if you have not received this email.

## Connecting to MN4
From your computer terminal, use your SSH client to connect to a MN4 login node.
There are three login nodes, `mn1.bsc.es`, `mn2.bsc.es`, and `mn3.bsc.es`.
You can connect to any of them, they are used interchangeably in the examples below.

### Via conventional SSH client (Mac, Linux, Windows with WSL/Cygwin)

From a terminal, run

{% highlight bash %}
$ ssh <USERNAME>@mn1.bsc.es
{% endhighlight%}

where `<USERNAME>` is your BSC username (e.g., `ctn99999`).  You will be prompted
for the corresponding password.

If you want to enable visualization, you need to use the `-X` option:
{% highlight bash %}
$ ssh -X <USERNAME>@mn1.bsc.es
{% endhighlight %}

### Via PuTTY or mobaXterm

If you don't have any SSH client installed in your computer,
please download and install
[mobaXterm](https://mobaxterm.mobatek.net/download.html)
(recommended)
or
[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

When you open the graphical interface define the server/host name (`mn3.bsc.es`)
and provide your username and password when prompted.
For mobaXterm, there is a short
generic demo video available [here](https://mobaxterm.mobatek.net/demo.html).

For visualizations using PuTTY, please keep in mind the following:
 * Under connection → SSH → X11, make sure that the "Enable X11 forwarding" option is checked.
 * You also need to install [xMing](https://sourceforge.net/projects/xming/).

In mobaXterm this is enabled by default.

## Changing your password

Please change your password as soon as possible.
In order to do this, connect via ssh to `dt01.bsc.es` and execute the `passwd` command;
the prompt will ask you for your existing password (once) and for your new password (twice).
The new password takes about 10 minutes to be effective.
A sample session for changing the password is:

{% highlight bash %}
$ ssh <USERNAME>@dt01.bsc.es

username@dtransfer1:~> passwd
Changing password for username.
Old Password:
New Password:
Reenter New Password:
Password changed.
{% endhighlight %}


## Submitting a job

Calculations in MareNostrum 4 need to be submitted through the queing system. For that purpose,
we will be using a job script, provided in `/gpfs/projects/nct00/nct00003/SCRIPTS/runmn.sh`.
You will need to copy this script to each tutorial folder in which you intend to run `siesta`.

The contents of the script are:

{% highlight slurm %}
#!/bin/bash
#SBATCH -J tutorialXX
#SBATCH -n 4
#SBATCH -t 0:30:00
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err
#SBATCH -D .

source /gpfs/projects/nct00/nct00003/siestarc.sh

srun -n 4 siesta < input.fdf > output.out
{% endhighlight %}

Note that `input.fdf` and `output.out` are generic input and output
file names, for each execution of `siesta` you will need to change them
to the actual names of your input and output files.
It is also convenient to change the name of the job (`#SBATCH -J` option)
to something that allows you to identify (vs. your other submissions)
when checking the status of the queue.

The `-n` options in `#SBATCH` and `srun` indicate the
number of computing cores used.
Please **do not** needlessly increase these quantities,
be mindful that resources are limited and must be shared between all of the students.

You can submit this job script from a login node by executing:

{% highlight bash %}
$ sbatch runmn.sh
{% endhighlight %}

For more information on running jobs, visit and read
[the MareNostrum guides](https://www.bsc.es/supportkc/docs/MareNostrum4/intro).

### SLURM reservations
BSC has enabled two daily reservations for us, for the duration of the school:
* `SIESTA-DAY` (between 08:00 and 21:00 CEST): 9 MN4 nodes (48 cores each).
* `SIESTA-NIGHT` (between 21:00 and 08:00 CEST): 3 MN4 nodes (48 cores each).

In order to make use of these reservations, run sbatch with the reservation option:

{% highlight bash %}
$ sbatch runmn.sh --reservation=SIESTA-DAY
{% endhighlight %}

or

{% highlight bash %}
$ sbatch runmn.sh --reservation=SIESTA-NIGHT
{% endhighlight %}

## Directory with tutorials
For every practical there is a folder in the shared directory
`/gpfs/projects/nct00/nct00003/TUTORIALS/`
that contains all the files you will need for said practical.
At the start of every tutorial, please copy the required files from that shared directory
to your scratch folder.  For example, for the practical of the first day,

{% highlight bash %}
$ cd /gpfs/scratch/nct01/<USERNAME>
$ cp -pr /gpfs/projects/nct00/nct00003/TUTORIALS/day1 .
{% endhighlight %}

Please do NOT copy these files before the start of the practical, in case they are updated
shortly before the practical starts.

Note: We will be running everything in the scratch folder, since disk space is limited in `$HOME`.

## Visualization

We strongly encourage you do visualizations in your own
computer. You will first need to copy the files to it (see instructions below).
Visualizations can also be done in the reserved compute nodes,
but this is not recommended.

Visualizations done directly on the MareNostrum login nodes
will result in **account banning**.

### Tools used for visualization
If you run visualizations in your own PC, you may want to install the following software,
which will be used during the school:

* [gnuplot]( http://www.gnuplot.info/ )
* [xcrysden]( http://www.xcrysden.org/ )
* [vesta]( https://jp-minerals.org/vesta/en/ )
* [vmd]( https://www.ks.uiuc.edu/Research/vmd/ )
* Python with matplotlib

### Visualization on the BSC compute nodes

In this case you will need to connect directly (interactively) to a compute node instead
of submitting a job script.
In order to do this, you need to execute the following command
from one of the login nodes of MareNostrum 4:

{% highlight bash %}
$ salloc -t 4:00:00 -n 1 -c 1 --reservation=SIESTA-DAY -J siestaschool
{% endhighlight %}

This will create a 4-hour long reservation (`-t` option), with 1 task (`-n`) that uses 1 CPU core (`-c`).
The `-J` option is again an identifier that you can change at will.
If you try this overnight, remember to change the `SIESTA-DAY` to `SIESTA-NIGHT`.

Again, please **do not** needlessly increase these quantities,
be mindful that resources are limited and must be shared between all of the students.

Once inside this interactive session, make sure that you load the Siesta school environment
before doing anything:

{% highlight bash %}
$ source /gpfs/projects/nct00/nct00003/siestarc.sh
{% endhighlight %}

This will give you access to the siesta binary and to the rest of the tools of the school.

Beware that the Siesta school environment will stay active as long as your interactive session is active.
If you logout or otherwise lose conntection to the compute node, you will need to load the environment again when you reconnect.

**We encourage you to run visualizations locally on your own computer.**

## Copying and backing up files

You can backup your files in case you want to keep them after the school is finished.
You need to do this from your local machine (you cannot start outgoing
connections from BSC machines).  It is recommended that you transfer your files from one
of the data transfer nodes (`dt01.bsc.es`) rather than from one of the login nodes.

You can transfer files in multiple ways:

* Via `scp` or `rsync` (Mac, Linux, Windows with WSL/Cygwin).  For example,
from your local computer:

{% highlight bash %}
$ scp -pr <USERNAME>@dt01.bsc.es:/path/to/files .
{% endhighlight %}

* Via `sshfs` (all platforms).
This may be specially useful for those running exclusively Windows.
Please check the `sshfs` documentation at
[the BSC guides](https://www.bsc.es/supportkc/docs/dtmachines/).


## Data preservation

**You will lose access to your account on October 7th or shortly afterwards.
We strongly recommend that you perform regular (at least daily)
backups of your BSC files to prevent the loss of any
data.**

## Advanced (no support given)

* If you want to try your own SIESTA compilation,
have a look at
[this SIESTA compilation how-to](https://docs.siesta-project.org/projects/siesta/en/latest/how-to/installation/build-manually.html).
Be sure to have all dependencies beforehand. Note that we will not be answering questions
regarding compilation or other installations during the school.

* Perform your visualizations with [ovito](https://www.ovito.org/about/).

