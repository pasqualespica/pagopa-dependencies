#!/bin/bash
DEFAULT_EXT="*.wsdl"
VERBOSE=0
usage=NOK
isEqual=1

# Check parameter
while (( "$#" )); do
    case "$1" in
        -h|--help)
            echo ""
            echo "Usage :"
            echo " $0 [-h] [-v] [-f <file_name> | -e ext_files] <source-path-dir> <destination-path-dir>"
            echo ""
            exit 0
        ;;
        
        -v|--vervose)
            VERBOSE=1
            shift
        ;;
        
        -vv|--very-vervose)
            VERBOSE=2
            shift
        ;;
        
        -f|--file)
            if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
                MY_FILE=$2
                shift 2
            else
                echo "Error1: Argument for $1 is missing" >&2
                exit 1
            fi
        ;;
        
        -e|--ext)
            if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
                DEFAULT_EXT="*."$2
                shift 2
            else
                echo "Error2: Argument for $1 is missing" >&2
                exit 1
            fi
        ;;
        
        *) # preserve positional arguments
            # echo "$# $@"
            if [ $# -eq 2 ] && [ -n "$2" ] && [ -n "$1" ]; then
                SRC=$1
                DST=$2
                usage=OK
            else
                usage=NOK
            fi
            break
        ;;
        
    esac
done


if [ "$usage" = "OK" ]
then
    echo -n "Start... "
    l1=`find $SRC -name $DEFAULT_EXT | xargs -L1 -I{} basename "{}" > file1.txt`
    l2=`find $DST -name $DEFAULT_EXT | xargs -L1 -I{} basename "{}" > file2.txt`
    
    comuni=`comm -12 <(sort file1.txt) <(sort file2.txt)`
    
    if [ $VERBOSE == 1 ]; then
        
        echo "Start ..."
        
        echo ">>>>>>>>>>>>>>>>>>>>"
        echo ">>> common files >>>"
        echo ">>>>>>>>>>>>>>>>>>>>"
        comm -12 <(sort file1.txt) <(sort file2.txt)
        
        echo ">>>>>>>>>>>>>>>>>>>>"
        echo ">>> only into $DST"
        echo ">>>>>>>>>>>>>>>>>>>>"
        comm -13 <(sort file1.txt) <(sort file2.txt)
        
        echo ">>>>>>>>>>>>>>>>>>>>"
        echo ">>> only into $SRC"
        echo ">>>>>>>>>>>>>>>>>>>>"
        comm -23 <(sort file1.txt) <(sort file2.txt)
        
        echo ">>>>>>>>>>>>>>>>>>>>"
        echo ">>> DEFAULT filter $DEFAULT_EXT applied"
        echo ">>>>>>>>>>>>>>>>>>>>"
        
    fi
    
    # remove TMP file
    rm -f file1.txt file2.txt
    
    for entry in $comuni
    do
        # echo $entry1
        file1=`find $SRC -name $entry`
        file2=`find $DST -name $entry`
        
        # echo "diff $file1 $file2"
        num_diff=`diff $file1 $file2 -U 0 | grep -v ^@ | wc -l`
        
        differenze=${num_diff//[[:blank:]]/}
        if [ $differenze != "0" ]; then
            isEqual=0
        fi
        
        if [ $VERBOSE == 1 ]; then
            echo "differences for $entry are : ${differenze}"
        fi
        
        if [ $VERBOSE == 2 ]; then
            diff $file1 $file2
        fi
        
    done
    
    if [ $isEqual == 1 ]; then
        echo "$SRC and $DST are equal."
    else
        echo "$SRC and $DST are different !!!"
    fi
    echo "Done !"
    
else
    echo ""
    echo "Bad usage !!!"
    echo " $0 [-h] [-v] [-f <file_name> | -e ext_files] <source-path-dir> <destination-path-dir>"
    echo ""
fi
