# Commands for your first day


## Connections to remote servers and file systems

Connect to server:

    $ssh username@server.name.virginia.edu

Example:

    $ssh username@rivanna.hpc.virginia.edu

This connects you to Rivanna in your /home/username directory.

Go to your scratch directory:

    $cd /scratch/username

Disconnect from server:

    $logout

After you have installed [XQuartz](https://www.xquartz.org/) on your local machine, you can connect to a server like this:

    $ssh -Y username@server.name.virginia.edu

The -Y option allows you to open windows to view things like plots. Technically, it enables trusted X11 forwarding, which is not subjected to the X11 SECURITY extension controls that are subjected to forwarding with the -X option.

You can read more about ssh options with this command:

    $man ssh

Mount remote file systems to local file system with FUSE and sshfs:

    $sudo mkdir /Volumes/remote/name1/
    $sudo sshfs -o allow_other,defer_permissions username@remote.file.system.name.xxx:/remote/directory/ /Volumes/remote/name1/

While it is customary to mount remote file systems to the `/Volumes` directory in MacOS, that practice results in a lot of `sudo`ing. You can also mount remote systems in less sensitive places. Here is an example:

    $mkdir ~/remote/name1/
    $sshfs -o allow_other,defer_permissions username@remote.file.system.name.xxx:/remote/directory/ ~/remote/name1/

You can get FUSE and sshfs for MacOS from [osxfuse](https://osxfuse.github.io/).

If the above commands don't seem to work for you, there is a more detailed [guide][sshfs] to mounting remote file systems over sshfs. Furthermore, if you have a problem accessing the mounted file system after your computer falls asleep, refer to the discussion of this [issue](https://github.com/osxfuse/osxfuse/issues/45#issuecomment-21943107).

Mount remote file systems to local with mount command:

    $sudo mkdir /Volumes/remote/name2/
    $sudo mount -t smbfs //username@remote.file.system.name.xxx/remote/directory /Volumes/remote/name2/

This command shows how to mount an smb file system, but there are other types too.


## Explore your server environment

Check your storage space:

    $sfsq

Display the contents of a directory:

    $ls
    $ls -a

Display only directories:

    $ls -d */
    $ls -ad /.*


## Run a bash script

Open a simple text editor:

    $nano filename.bash

Run it:

    $./filename.bash

Or you can use:

    $bash filename.bash

To format an sbatch script for submission of jobs to the compute nodes via SLURM:

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks=1
    #SBATCH --ntasks-per-node=1
    #SBATCH --cpus-per-task=1
    #SBATCH --mem=15000
    #SBATCH --time=10:00:00
    #SBATCH --partition=standard
    #SBATCH --account=cphg_accountname
    #SBATCH	--mail-type=ALL
    #SBATCH	--mail-user=username@virginia.edu

Brief note on SBATCH variables:
  * to run a multi-threaded process, you will typically set the number of threads with the cpus-per-task variable
  * the mem variable is in megabytes, so the memory allocation shown in the example above is 15GB
  * the mem-per-cpu variable (not included above) is also in megabytes
  * the time variable is in hours:minutes:seconds format
  * the mail-type options are not necessary, but if you want email alerts, the options are START/END/ABORT/ALL

How to choose memory allocations:
* A quick way to choose memory allocations for processes is to set the memory to the size of the largest file your application will process. Sometimes this will not be enough, and your SLURM output log will show a memory error, and you'll have to try again with a higher memory allocation.
* If anyone has a more reliable method, please add a link here.


## Running applications on Rivanna

To check to see available applications:

    $module avail

To load an application as a module:

    $module load application_name

Example:

    $module load sratoolkit/2.8.0

To purge a previously loaded module:

    $module purge

To use a conda environment:

    $module load anaconda/5.2.0-py3.6
    $conda env list
    $source activate custom_env
    $source deactivate custom_env

To use R 3.5.1:

    $module load gcc/7.1.0
    $module load R/3.5.1


## File transfers

To transfer small files between servers and/or file systems:

    $scp username@source.server.name:source_path/filename username@destination.server.name:destination_path/filename
    $rsync -ahrvz username@source.server.name:source_path/filename username@destination.server.name:destination_path/filename

In the rsync command, a=archive (preserves ownership and timestamp); h=human readable; r=recursive; v=verbose; z=compression.

Lots of times, the files you transfer are compressed and packaged as tar files. To unpack tar files:

    $tar -xvf filename

In the tar command, x=extract; v=verbose; f=use archive file.

To transfer large files between servers and/or file systems, use Globus. Go to globus.org --> University of Virginia --> eServices login.

UVa has a main node that is mounted to Rivanna and other university file systems called uva#main-DTN.

Download globus connect:

    $wget https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz
    $tar -xzf globusconnectpersonal-latest.tgz
    $cd globusconnectpersonal-x.y.z


## Working with screens

To open a screen for processes in background:

    $screen -S new_screen_name  #S = socket

To exit the new screen:

    [control^] + [A] +[D] keys

To return to the new screen:

    $screen -r new_screen_name  #r = return

To list all screens running on account:

    $screen -ls

To exit from within screen:

    $exit

[sshfs]: https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh
