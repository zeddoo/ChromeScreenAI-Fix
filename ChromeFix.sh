#!/bin/zsh --no-rcs

#Get all users
for dir in /Users/*;
do
    # Exclude "Shared" and user folders that have "admin" in the name
    if [[ "$dir" != "/Users/Shared" && "$dir" != *"admin"* ]]; then

        # logic that accounts for multiple libchromescreenai.so file in the user directory
        find "$dir/Library/Application Support/Google/Chrome/" -type f -name "libchromescreenai.so" | while IFS= read -r file; do
            echo "Running xattr -c on $file"
            xattr -c "$file"
        done
    fi
done