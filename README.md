# syncComputers

This is a repo created to sync my laptop and desktop home directories, snap packages, and apt packages. I push/pull changes to/from a remote server (in this case it's a raspberry pi with a disk attached).  

## WARNING
Both my laptop and PC run on Ubuntu 22.04. I can't guarentee this script will work as intended for you if you use a different linux distribution and/or different package managers. Modify the scripts as you see fit to be compatible with your directory structure, the directory you cloned this into, and your package managers.  

## Description
`rsync` is used to sync the home directories.  
`exclude.txt` includes all the directories and files to exclude from `rsync`. Manually edit to your content.  
`apt.txt` includes all the packages explicitly installed via the apt package manager.  
`snap.txt` includes all the snap packages installed.  
`other.txt` includes all other commands to run to fill in gaps as needed. Manually edit to your content.  
`pushHome.sh` is the script used to push changes to the remote server.  
`pullHome.sh` is the script used to pull changes from the remote server.  

You may additionally configure a `cronjob` and/or a `systemd` service to run either of these scripts automatically on a schedule or at startup.  

## LICENSE
MIT License

Copyright © 2024 Eliot Khachi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
