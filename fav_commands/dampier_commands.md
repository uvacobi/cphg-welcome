# My favorite commands

## Chris Dampier

### Unix terminal commands for MacOS

To check battery level in Bluetooth devices:

    $ioreg -l | grep -E "BatteryPercent|Bluetooth Product Name"

To reconnect mouse when it gets lost:

    $open /Applications/System\ Preferences.app/Contents/MacOS/System\ Preferences
    OR
    $open -a System\ Preferences

To stop Spotlight from indexing a particular volume:

    $sudo mdutil -i off /Volumes/remote

To check processes using a particular volume:

    $sudo lsof | grep 'volume_name'

To unmount a recalcitrant volume:

    $sudo kill PID; sudo umount volume_name

To set directory as read/write/execute for user and group:

    $chmod ug+rwx dir_name

To check cores on local machine:

    $sysctl hw.physicalcpu hw.logicalcpu

To clone latest version of GitHub project:

    $git clone --depth=1 git://github.com/globus/globus-cli

To keep machine awake:

    #for duration of a given process
    $caffeinate -w PID

    #for a given amount of time (in seconds)
    $caffeinate -t seconds


### Linux terminal commands for Rivanna

To modify path variable:

    $GLOBUS_CLI_INSTALL_DIR="$(python -c 'import site; print(site.USER_BASE)')/bin"
    $echo "GLOBUS_CLI_INSTALL_DIR=$GLOBUS_CLI_INSTALL_DIR"
    $export PATH="$GLOBUS_CLI_INSTALL_DIR:$PATH"
    $echo 'export PATH="'"$GLOBUS_CLI_INSTALL_DIR"':$PATH"' >> "$HOME/.bashrc"

To check job queue:

    $squeue -o "%.5i %.2t %.4M %.5D %m"
    $scontrol show job ###

To check job completion details:

    $sacct -j <jobid> -o jobid,jobname,state,exitcode,derivedexitcode
    $sacct -j <jobid> -o jobid%16,jobname,AllocTres%21,MaxRSS,MaxVMSize,state%14,exitcode%8,derivedexitcode

To list groups user is in:

    $groups

To change current group ID during a login:

    $newgrp group_name

To explore filesystems mounted on Rivanna:

    $df -h
