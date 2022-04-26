#!/bin/sh
# usage: sudo ./create_user.sh

user=foo
username="foo name"

# Create user
sysadminctl -addUser $user -fullName $username
dscl . -append /Groups/admin GroupMembership $user
dscl . -passwd /Users/$user
