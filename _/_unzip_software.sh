#!/bin/bash

if [ -z $1 ]; then
    echo "Please provide the folder name.";
    exit 1;
fi
echo tar -xzf file.tar.gz
#!/bin/bash
DIRECTORY="/path/to/your/folder"

while IFS= read -r -d '' file; do
    echo "$file"
done < <(find "$DIRECTORY" -type f -print0)    
