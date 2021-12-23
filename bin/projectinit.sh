#!/bin/bash

projectName=$1
echo "Create template project ${projectName}." 

mkdir ${projectName}
cd ${projectName}
cp -r ~/.bin/projectinit/* .
cmake -S . -B build  -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
cp build/compile_commands.json .

echo '{' >> .vimspector.json
echo '    "configurations": {' >> .vimspector.json
echo '        "launch": {' >> .vimspector.json
echo '            "adapter": "CodeLLDB",' >> .vimspector.json
echo '            "filetypes": [ "cpp" ],' >> .vimspector.json
echo '            "configuration": {' >> .vimspector.json
echo '                "request": "launch",' >> .vimspector.json
echo "                \"program\": \"$(pwd)/build/src/Project_run\"" >> .vimspector.json
echo '            }' >> .vimspector.json
echo '        }' >> .vimspector.json
echo '    }' >> .vimspector.json
echo '}' >> .vimspector.json


