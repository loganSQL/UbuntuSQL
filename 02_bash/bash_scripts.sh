#!/bin/bash
# https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php

##################################
# ### 	The Shebang (#!)
# ###	change to execution mode
##################################
chmod 755 myscript.sh
echo $PATH
/home/logan/bin:/home/logan/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

###################################################
#	VARIABLES
# $1 to represent the first command line argument
# $2 to represent the second command line argument

###################################################

#!/bin/bash
# A simple copy script
cp $1 $2
# Let's verify the copy worked
echo Details for $2
ls -lh $

############################################################################
#	SPECIAL VARIABLES
    $0 - The name of the Bash script.
    $1 - $9 - The first 9 arguments to the Bash script. (As mentioned above.)
    $# - How many arguments were passed to the Bash script.
    $@ - All the arguments supplied to the Bash script.
    $? - The exit status of the most recently run process.
    $$ - The process ID of the current script.
    $USER - The username of the user running the script.
    $HOSTNAME - The hostname of the machine the script is running on.
    $SECONDS - The number of seconds since the script was started.
    $RANDOM - Returns a different random number each time is it referred to.
    $LINENO - Returns the current line number in the Bash script.
#############################################################################





