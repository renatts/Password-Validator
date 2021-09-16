$password = $args[0]
$OK = 0

# Includes 10 or more chars validation
if ($password.Length -lt 10) {
    write-host -ForegroundColor red "ERROR: Password is shorter than 10 characters" 
}
else {
    $OK++;
}  

# Includes capitals validation
if ($password -cmatch "[A-Z]") { $OK++; }
else {
    write-host -ForegroundColor red "ERROR: Password doesn't include capitals"
}

# Includes lowercase letters validation
if ($password -cmatch "[a-z]") { $OK++; }
else {
    write-host -ForegroundColor red "ERROR: Password doesn't include lowercase letters"
}

# Includes digits validation
if ($password -cmatch "[0-9]") { $OK++; }
else {
    write-host -ForegroundColor red "ERROR: Password doesn't include digits"
}

# Check OK status, if OK isn't equal to 4, means he isn't passed all 4 validations
if ( $OK -eq 4) {
    write-host -ForegroundColor green "Your password is correct"
    exit 0;
}
else {
    write-host -ForegroundColor red "Bad Password..."
    exit 1;
}