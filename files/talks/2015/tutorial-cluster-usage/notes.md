# Clusters

Typical organization

- one *head node*
- many compute nodes (some may be special)

(A node is a computer)

## Using cluster

1. Login to head (`ssh headnode`)
2. *submit job* to run on compute nodes

### Interactive jobs

**Do not compute on the head node**
(if it takes more than 2 seconds, it shouldn't be run there!)

Get a shell on a compute node

    qrsh # GE
    bsub -I /bin/bash # LSF


### Batch jobs

schedule a job, will be queued and run whenever the queue is free

    qsub script.sh # GE
    bsub script.sh # LSF


Check on your jobs

    qstat # GE
    bjobs # LSF

Kill your jobs

    qdel # GE
    bkill # LSF

## Allocate resources

Many different syntax options.

## Defensive programming

### Write to temp and move

Three step step output writing:

1. Open temp output file
2. Write to temp file & close it
3. Move temp to final as **the final step in the computation**

This way you know that **if there is an output file, then the computation finished correctly!


### Early exit on error

No silent errors

    set -e

## Job Arrays

Run same script with a different index passed in an environmental variable.

Scheduling a job array

    qsub -t 1-100 script.sh # GE
    bsub -J "myjob[1-100]" script.sh # LSF

Looking up the task ID:

    echo $SGE_TASK_ID # GE
    echo $LSB_JOB_INDEX # LSF

A little one liner to get a line from a file

    sed -n "${SGE_TASK_ID}p" file-list.txt         # GE
    sed -n "${LSB_JOB_INDEX}p" file-list.txt   # LSF

