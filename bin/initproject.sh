#!/bin/bash

projectName=$1
echo "Create template project ${projectName}." 

mkdir ${projectName}
cd ${projectName}
cp ~/.bin/initproject/CMakeLists.txt .
cp ~/.bin/initproject/main.cxx .
cp ~/.bin/initproject/main.hxx .
cp ~/.bin/initproject/main_test.cxx .
cp ~/.bin/initproject/README.md .
cmake -S . -B build  -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
cp build/compile_commands.json .

echo '{' >> .vimspector.json
echo '    "configurations": {' >> .vimspector.json
echo '        "launch": {' >> .vimspector.json
echo '            "adapter": "CodeLLDB",' >> .vimspector.json
echo '            "filetypes": [ "cpp" ],' >> .vimspector.json
echo '            "configuration": {' >> .vimspector.json
echo '                "request": "launch",' >> .vimspector.json
echo "                \"program\": \"$(pwd)/main\"" >> .vimspector.json
echo '            }' >> .vimspector.json
echo '        }' >> .vimspector.json
echo '    }' >> .vimspector.json
echo '}' >> .vimspector.json


