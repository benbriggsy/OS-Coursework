#!/bin/bash
MYOPTR=
MYOPTF=
while getopts "r:f:" OPTION
do
    case $OPTION in
        r)
            echo "You set flag -r"
	    MYOPTR=$OPTARG
	    echo $MYOPTR
            
            ;;
        f)
            echo "The value of -f is $OPTARG"
            MYOPTF=$OPTARG
            echo $MYOPTF
            
            ;;
        ?)
            echo "Used for the help menu"
            exit
            ;;
    esac
done

cat $MYOPTF
make 

eval $MYOPTR
