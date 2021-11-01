#!/bin/bash

PASSWORD=$1
ERROR=0

# Colors
GREEN='\033[1;92m' # Success
RED='\033[1;91m'   # Error

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

# Check ERROR status, if ERROR is equal to 1, means he isn't passed all validations
if [[ $ERROR -eq 1 ]];
then
    echo -e "${RED}Bad Password..." && exit 1
else
    echo -e "${GREEN}Your password is correct!" && exit 0
fi
