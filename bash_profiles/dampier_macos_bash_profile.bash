###
### My MacOS Bash Profile: Chris Dampier
###

  # to refresh the .bash_profile after edits:
  # exec "$BASH" replaces current shell with a new instance of the shell
  # source ~/.bashrc preserves current shell

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# added by Anaconda3 installer
export PATH="/Users/chd5n/anaconda3/bin:$PATH"

# required for globus-cli
export PATH="/Users/chd5n/.local/bin:${PATH}"

# to get colors in terminal as in linux
export CLICOLOR=1
#for light blue directories (this doesn't seem to work)
export LSCOLORS=Exfxcxdxbxegedabagacad

# MacPorts Installer addition on 2019-01-11_at_17:55:18: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# to access commonly used pathnames without typing escape characters
big="BIG-IP Edge Client"
excel="Microsoft Excel"
outlook="Microsoft Outlook"
mau="Microsoft AutoUpdate"

# aliases

# to check battery left on Bluetooth devices
alias btcheck='ioreg -l | grep -E "BatteryPercent|Bluetooth Product Name"'

# functions

# to open system preferences when mouse gets lost
syspref () { open -a System\ Preferences ; }
# alternative
#alias syspref='open -a System\ Preferences'

# to mount shared caseylab file system
mntcasey () { mount -t smbfs //chd5n@***.virginia.edu/***/***/cphg_CaseyLab ~/remote/caseylab/ ; }

# to mount rivanna server file system; must specify home vs scratch
mntriv () { sshfs -o allow_other,defer_permissions chd5n@rivanna.hpc.virginia.edu:/$1/chd5n ~/remote/rivanna_$1 ; }

# to open image files (esp pdf)
adobe () { open -a Adobe\ Acrobat\ Reader\ DC $1 ; }
prev () { open -a Preview $1 ; }

# to open spreadsheets
excel () { open -a Microsoft\ Excel $1 ; }

###           ###
### reminders ###
###           ###


### variables ###

# to create/load/set a variable
#varname=value

# to list all loaded variables
#env

# to remove/delete/unset a variable
#unset varname


### aliases ###

# to create/load/set an alias
#alias aliasname='command -[options]'

# to list all loaded aliases
#alias

# to remove/delete/unset an alias
#unalias aliasname


### functions ###

# to create/load/set a function
#function_name () { command -[options] $variables ; }

# to list all loaded functions
#declare -f[-F]
#compgen -A function_name
#type function_name

# to remove/delete/unset a function
#unset -f function_name
