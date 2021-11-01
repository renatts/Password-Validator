#!/bin/bash

ERROR=0

# Colors
GREEN="\033[1;92m" # Success
RED="\033[1;91m"   # Error

if [[ $1 == "-f" ]] ; # Check if first argument is -f
then
    file_to_check=$2
    password_file="$(find . | grep txt)"
    file_to_check="$(cat "$password_file")"
    PASSWORD=$file_to_check
else
    PASSWORD=$1
fi

# Includes 10 or more chars validation
if ! [[ ${#PASSWORD} -ge 10 ]];
then 
    echo -e "${RED}ERROR: Password is shorter than 10 characters" && ERROR=1
fi

# Includes capitals validation
if ! [[ $PASSWORD =~ [[:upper:]] ]];
then 
    echo -e "${RED}ERROR: Password doesn't include capitals" && ERROR=1 
fi

# Includes lowercase letters validation
if ! [[ $PASSWORD =~ [[:lower:]] ]];
then  
    echo -e "${RED}ERROR: Password doesn't include lowercase letters" && ERROR=1 
fi

# Includes digits validation
if ! [[ $PASSWORD =~ [[:digit:]] ]];
then 
    echo -e "${RED}ERROR: Password doesn't include digits" && ERROR=1
fi

# Check OK status, if OK isn't equal to 4, means he isn't passed all 4 validations
if [[ $ERROR -eq 1 ]];
then
    echo -e "${RED}Bad Password..." && exit 1
else
    echo -e "${GREEN}Your password is correct!" && exit 0
fi

