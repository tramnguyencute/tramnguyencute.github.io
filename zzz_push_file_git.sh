#!/bin/sh
git add .
echo "Nhap noi dung commit tren Editor > Save > Close(Ctrl+F4 for VScode)"
git commit ##
# git log -p master -1
git push
read -n 1 -r -s -p $'Press enter to exit...\n'
