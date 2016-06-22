#!/bin/bash

#-- REQUIRED PARAMETERS
#-- $1 = command (install|upgrade)
#-- $2 = WP tag version (default 4.5.2)

#-- DEFAULT VARIABLES
WP_GIT="git://github.com/WordPress/WordPress.git"
WP_TAG="4.5.2"
WP_DIR="WP"

#-- Check if installation directory is present
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WP_PATH=$CWD"/"$WP_DIR

#-- Check GIT executable
GIT_EXEC=`which git`
if [ -z "$GIT_EXEC" ]; then
    echo "No Git executable to use."
    exit 11
fi


#-- Execute command parameter
case "$1" in
    install)
        #-- Check if git is already installed in path
        if [ -d "$WP_PATH/.git" ]; then
            echo "WP already installed in [ $WP_PATH ]"
            exit 2
        fi

        #-- Create the necesary path
        if [ ! -d "$WP_PATH" ]; then
            mkdir $WP_PATH
        fi

        #-- Clone the repo
        echo "-- Cloning $WP_GIT into $WP_PATH..."
        $GIT_EXEC clone $WP_GIT $WP_PATH
        if [ $? -ne 0 ]; then
            echo "Git clone execution failure [ $? ] command [ $GIT_EXEC clone $WP_GIT $WP_PATH ]"
            echo 3
        fi

        #-- Swith to the repo
        echo "-- Acquiring CodeIgniter tags"
        cd $WP_PATH
        $GIT_EXEC fetch --tags
        echo "-- Available tags :"
        $GIT_EXEC tag

        #-- Switch to the actual tag
        if [ ! -z "$2" ]; then
            WP_TAG="$2"
        fi
        echo "-- Switching to tag $WP_TAG"
        $GIT_EXEC checkout $WP_TAG
        if [ $? -ne 0 ]; then
           echo "Tag switching failed. Manually checkout tag [ $WP_TAG ] on [ $WP_PATH ] or clean the directory and try the command again."
           exit 4
        fi
        ;;

    upgrade)
        #-- Check if git is already installed in path
        if [ ! -d "$WP_PATH/.git" ]; then
            echo "WP not yet installed in [ $WP_PATH ]"
            exit 5
        fi

        #-- Swith to the repo
        echo "-- Acquiring CodeIgniter tags"
        cd $WP_PATH
        $GIT_EXEC fetch --tags
        echo "-- Available tags :"
        $GIT_EXEC tag

        #-- Switch to the actual tag
        if [ ! -z "$2" ]; then
            WP_TAG="$2"
        fi
        echo "-- Switching to tag $WP_TAG"
        $GIT_EXEC checkout $WP_TAG
        if [ $? -ne 0 ]; then
           echo "Tag switching failed. Manually checkout tag [ $WP_TAG ] on [ $WP_PATH ] or clean the directory and try the command again."
           exit 4
        fi
        ;;


    *)
        echo "Unknown command parameter"
        exit 1
esac

echo "wp_install.sh [ $1 ] successful"
exit 0

