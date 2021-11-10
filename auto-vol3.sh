#! /bin/bash

echo 
echo '     #################################################################### ' | lolcat
figlet -f miniwi '     Welcome to Memory Forensics' | lolcat
echo '     #################################################################### ' | lolcat
echo
figlet -f miniwi '         Volatility Framework' | lolcat
figlet -f miniwi '  Exclusively Automated by Anant Kaul' | lolcat
echo 
# eval $hashes

good_bye() {

    echo
    eval $hashes 
    echo 
    echo " >> Now you're finished with your Memory Forensics Investigation !!"
    echo ' >> Please move on with other needed Investigations ...'
    echo ' >> Suggestions Already Given by "The Volatility Framework" !!'
    echo " >> Do check '$DIR' for Further Investigations ..."
    # echo " >> Outputs will be overwritten next time if not copied !!"
    echo
    figlet -f Digital '        SPECIAL THANKS TO THE CREATORS' | lolcat
    echo
    figlet -f Kban 'Anant Kaul' | lolcat
    figlet -f Kban '        AND' | lolcat
    figlet -f Kban '  Volatility' | lolcat
    # figlet -f Digital 'SPECIAL THANKS TO THE CREATORS -- ©'
    exit
}

# echo
# read -p " >> Enter Full Path of Memory File: " path_to_file

hashes="echo '###############################################################################' | lolcat"

if [ -z "$1" ]; then
    echo
    eval $hashes
    echo 
    echo " >> ERROR: Please Enter Full Path of Memory File as argument."
    exit
fi

volatility2="volatility/vol.py -f $1"
volatility="volatility3/vol.py -f $1"
render_pretty='-r pretty'
render_csv='-r csv'

location=$PWD
DIR=$location/Investigations
created=false

## Sample Loop
# while true; do
#     read -p ' >> Do you wish to continue? ( Y/n ) ' yn
#     case $yn in
#         [Yy]* ) break;;
#         [Nn]* ) good_bye;;
#         * )  echo ; echo ' >> Please answer yes or no ...';;
#     esac
# done

create_dir() {

    if [ ! -d "$DIR" ]; then
        mkdir $DIR
    fi    

    counter=1
    while true; do
        if [ ! -d "$DIR/$counter" ]; then
            DIR=$DIR/$counter 
            mkdir $DIR
            # cd $DIR
            break  
        fi        
        (( counter++ ))
    done
    created=true
}

check_dir() {
     if [[ "$created" == false ]]; then 
        create_dir
    fi
    cd $DIR
}

ImageInfo_vol2() {

    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with ImageInfo (Using Volatility 2) ...'; echo ; $volatility2 imageinfo > Vol2_ImageInfo.txt; echo ; echo " >> Output saved in '$PWD/Vol2_ImageInfo.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with ImageInfo (Using Volatility 2) ...'; echo ; $volatility2 imageinfo; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

ImageInfo_vol3() {

    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with ImageInfo (Using Volatility 3) ...'; echo ; $volatility windows.info > Vol3_ImageInfo.txt; echo ; echo " >> Output saved in '$PWD/Vol3_ImageInfo.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with ImageInfo (Using Volatility 3) ...'; echo ; $volatility windows.info; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

ImageInfo() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Proceed with Volatility 2 (slow) or Volatility 3 (fast) ? [ 2/3 ] ' v
        case $v in
            2)  ImageInfo_vol2 ; break;;
            3)  ImageInfo_vol3 ; break;;
            * )  echo ; echo ' >> Please answer Volatility (2) or (3) ...';;
        esac
    done
}

PsList() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with PsList ...'; echo ; $volatility $render_csv windows.pslist > PsList.csv; echo ; echo " >> Output saved in '$PWD/PsList.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with PsList ...'; echo ; $volatility $render_pretty windows.pslist; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

PsTree() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with PsTree ...'; echo ; $volatility $render_csv windows.pstree > PsTree.csv; echo ; echo " >> Output saved in '$PWD/PsTree.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with PsTree ...'; echo ; $volatility $render_pretty windows.pstree; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

PsScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with PsScan ...'; echo ; $volatility $render_csv windows.psscan > PsScan.csv; echo ; echo " >> Output saved in '$PWD/PsScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with PsScan ...'; echo ; $volatility $render_pretty windows.psscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

NetScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with NetScan ...'; echo ; $volatility $render_csv windows.netscan > NetScan.csv; echo ; echo " >> Output saved in '$PWD/NetScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with NetScan ...'; echo ; $volatility $render_pretty windows.netscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

DllList() {

    eval $hashes
    echo 
    read -p 'Which PID you want? : ' read_dll
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with DllList ...'; echo ; $volatility $render_csv windows.dlllist --pid $read_dll > DllList.csv; echo ; echo " >> Output saved in '$PWD/DllList.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with DllList ...'; echo ; $volatility $render_pretty windows.dlllist --pid $read_dll; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

Handles() {

    eval $hashes
    echo 
    read -p 'Which PID you want? : ' read_handles
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Handles ...'; echo ; $volatility $render_csv windows.handles --pid $read_handles > Handles.csv; echo ; echo " >> Output saved in '$PWD/Handles.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Handles ...'; echo ; $volatility $render_pretty windows.handles --pid $read_handles; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

GetSIDs() {

    eval $hashes
    echo 
    read -p 'Which PID you want? : ' read_sids
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with GetSIDs ...'; echo ; $volatility $render_csv windows.getsids --pid $read_sids > GetSIDs.csv; echo ; echo " >> Output saved in '$PWD/GetSIDs.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with GetSIDs ...'; echo ; $volatility $render_pretty windows.getsids --pid $read_sids; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

RegistryHiveList() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Registry HiveList (For Virtual Memory) ...'; echo ; $volatility $render_csv windows.registry.hivelist > RegistryHiveList.csv; echo ; echo " >> Output saved in '$PWD/RegistryHiveList.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Registry HiveList (For Virtual Memory) ...'; echo ; $volatility $render_pretty windows.registry.hivelist; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

RegistryHiveScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Registry HiveScan (For Physical Memory) ...'; echo ; $volatility $render_csv windows.registry.hivescan > RegistryHiveScan.csv; echo ; echo " >> Output saved in '$PWD/RegistryHiveScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Registry HiveScan (For Physical Memory) ...'; echo ; $volatility $render_pretty windows.registry.hivescan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

RegistryUserAssist() {

    eval $hashes
    echo 
    read -p " >> Which Service/File you want? (Preferably Don't use Extention) : " read_userassist
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with Registry UserAssist ...'; echo ; $volatility windows.registry.userassist | egrep "$read_userassist" > RegistryUserAssist.txt; echo ; echo " >> Output saved in '$PWD/RegistryUserAssist.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with Registry UserAssist ...'; echo ; $volatility windows.registry.userassist | egrep "$read_userassist" ; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

TimeLiner() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with TimeLiner ...'; echo ; $volatility $render_csv timeliner > TimeLiner.csv; echo ; echo " >> Output saved in '$PWD/TimeLiner.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with TimeLiner ...'; echo ; $volatility $render_pretty timeliner; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

HashDump() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with HashDump ...'; echo ; $volatility $render_csv windows.hashdump > HashDump.csv; echo ; echo " >> Output saved in '$PWD/HashDump.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with HashDump ...'; echo ; $volatility $render_pretty windows.hashdump; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

ModScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with ModScan ...'; echo ; $volatility $render_csv windows.modscan > ModScan.csv; echo ; echo " >> Output saved in '$PWD/ModScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with ModScan ...'; echo ; $volatility $render_pretty windows.modscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

LsaDump() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with LsaDump ...'; echo ; $volatility windows.lsadump > LsaDump.txt; echo ; echo " >> Output saved in '$PWD/LsaDump.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with LsaDump ...'; echo ; $volatility windows.lsadump; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

FileScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with FileScan ...'; echo ; $volatility $render_csv windows.filescan > FileScan.csv; echo ; echo " >> Output saved in '$PWD/FileScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with FileScan ...'; echo ; $volatility $render_pretty windows.filescan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

SvcScan() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with SvcScan ...'; echo ; $volatility $render_csv windows.svcscan > SvcScan.csv; echo ; echo " >> Output saved in '$PWD/SvcScan.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with SvcScan ...'; echo ; $volatility $render_pretty windows.svcscan; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

CmdLine() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with CmdLine ...'; echo ; $volatility $render_csv windows.cmdline > CmdLine.csv; echo ; echo " >> Output saved in '$PWD/CmdLine.csv' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with CmdLine ...'; echo ; $volatility $render_pretty windows.cmdline; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

MalFind() {

    eval $hashes
    echo 
    while true; do
        read -p ' >> Do you want to store the Output? [ Y/n/(q)uit ] ' yn
        case $yn in
            [Yy]* ) check_dir; echo ' >> Starting with MalFind ...'; echo ' >> These can be Malicious (As suggested by Volatility Framework)' ; echo ' >> Looks Suspicious ...'; echo ; $volatility windows.malfind > MalFind.txt; echo ; echo " >> Output saved in '$PWD/MalFind.txt' "; echo ; cd $location; break;;
            [Nn]* ) echo ' >> Starting with MalFind ...'; echo ' >> These can be Malicious (As suggested by Volatility Framework)' ; echo ' >> Looks Suspicious ...'; echo ; $volatility windows.malfind; echo ; break;;
            [Qq]* ) echo ; break;;
            * )  echo ; echo ' >> Please answer yes or no ...';;
        esac
    done
}

MemDump() {

    eval $hashes
    echo 
    read -p ' >> Which PID you want to dump out? : ' read_dump 
    echo 
    echo ' >> Dumping out the Required Process (dmp) ...'
    echo 
    check_dir
    $volatility $render_pretty windows.pslist --pid $read_dump --dump
    echo 
    echo " >> Output saved in '$PWD/pid.*.dmp' "
    cd $location
    echo 
}

ProcDump() {

    eval $hashes
    echo 
    read -p ' >> Which PID you want to dump out? : ' read_procdump 
    read -p ' >> Which ImageProfile you want to use? : ' image_profile 
    echo 
    echo ' >> Dumping out the Required Executable (exe) ...'
    echo 
    check_dir
    $volatility2 --profile $image_profile procdump -p $read_procdump -D .
    echo 
    echo " >> Output saved in '$PWD/executable.*.exe' "
    cd $location
    echo 
}

while true; do
    echo '############################################################################### ' | lolcat
    echo 
    echo "        1   ->  ImageInfo                         12  ->  Timeliner"
    echo "        2   ->  PsList                            13  ->  HashDump"
    echo "        3   ->  PsScan                            14  ->  LsaDump"
    echo "        4   ->  PsTree                            15  ->  ModScan"
    echo "        5   ->  NetScan                           16  ->  FileScan"
    echo "        6   ->  DllList                           17  ->  SvcScan"       
    echo "        7   ->  Handles                           18  ->  CmdLine"
    echo "        8   ->  GetSIDs                           19  ->  MalFind"
    echo "        9   ->  Registry HiveList                 20  ->  MemDump (.dmp)"
    echo "        10  ->  Registry HiveScan                 21  ->  ProcDump (.exe)"
    echo "        11  ->  Registry UserAssist               99  ->  Exit"
    echo 
    read -p ' >> Which Operation you wish to perform? ' op
    case $op in
        1) echo ; ImageInfo;;
        2) echo ; PsList;;
        3) echo ; PsScan;;
        4) echo ; PsTree;;
        5) echo ; NetScan;;
        6) echo ; DllList;;
        7) echo ; Handles;;
        8) echo ; GetSIDs;;
        9) echo ; RegistryHiveList;;
        10) echo ; RegistryHiveScan;;
        11) echo ; RegistryUserAssist;;
        12) echo ; TimeLiner;;
        13) echo ; HashDump;;
        14) echo ; LsaDump;;
        15) echo ; ModScan;;
        16) echo ; FileScan;;
        17) echo ; SvcScan;;
        18) echo ; CmdLine;;
        19) echo ; MalFind;;
        20) echo ; MemDump;;
        21) echo ; ProcDump;;
        99) good_bye;;
        * )  echo ; echo ' >> Please answer in range (1-21) or 99 to exit ...'; echo ;;
    esac
done
