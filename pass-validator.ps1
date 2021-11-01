$password = $args[0]
$ERROR = 0

# Includes 10 or more chars validation
if ($password.Length -lt 10) {
    $ERROR = 1
    Write-Host -ForegroundColor red "ERROR: Password is shorter than 10 characters" 
}

# Includes capitals validation
if ( ! ($password -cmatch "[A-Z]")) {
    $ERROR = 1
    Write-Host -ForegroundColor red "ERROR: Password doesn't include capitals"
}

# Includes lowercase letters validation
if ( ! ($password -cmatch "[a-z]")) { 
    $ERROR=1
    Write-Host -ForegroundColor red "ERROR: Password doesn't include lowercase letters"
}

# Includes digits validation
if ( ! ($password -cmatch "[0-9]")) { 
    $ERROR=1
    Write-Host -ForegroundColor red "ERROR: Password doesn't include digits"
}

# Check OK status, if OK isn't equal to 4, means he isn't passed all 4 validations
if ( $ERROR -eq 1) {
    Write-Host -ForegroundColor red "Bad Password..."
    exit 1;
}
else {
    Write-Host -ForegroundColor green "Your password is correct"
    exit 0;
}
