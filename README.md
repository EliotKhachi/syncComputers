# syncComputers

This is a repo containing some scripts I use to sync my laptop and desktop home directories and software packages. I push and pull changes to and from a remote server.  

WARNING: Both my laptop and PC run on Ubuntu 22.04. Be careful when running these scripts, as your filesystem is probably not identical to mine. Modify the scripts as you see fit to enforce compatibility.   

It's worth mentioning that `rsync` is generally pretty safe to use, as it doesn't delete files or directories-- *but* it WILL overwrite files if they are the same name and in the same location.   
## Configuration
When modifying files in this repo to suit your needs, consider the following:  
* What server/network file system are you using? Connect it to your network and configure an SSH connection to it. I'm using a raspberry pi with an external disk.  
* What are the filesystem structures of *all* machines involved?   
* What package manager do your local machines use?  
* rename the `$repo` variable in `pull.sh` and `push.sh` to where you cloned this repo.  
* specify directories and files to exclude from `rsync` in `exclude.txt`.  
* negate anything in `exclude.txt` with `include.txt`.   
* `other.sh` includes all other commands to run to fill in gaps as needed. Manually edit to your content.  

## push.sh
* pushes local home directory to server with `rsync` and outputs `push.log`.  
* It also updates the `apt` and `snap` package lists.  
* Creates a git commit  
## pull.sh
* pulls the latest git repo  
* pulls server home directory with `rsync` and outputs `pull.log`.  
* Installs packages specified in `apt.txt` and `snap.txt` and any others specified in `other.sh`  
* Creates a git commit 

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
