# Docker Dev Environment

## Installation

### Install Docker for Mac

[Download the latest stable release](https://download.docker.com/mac/stable/Docker.dmg)

### Configure D4M File Sharing

We are going to handle mounting volumes using `d4m-nfs` for a nice speed boost. You will need to set the file sharing preferences in Docker for Mac D4M Preferences -> File Sharing to only share `/tmp`

This is the default file sharing:
![D4M Default File Sharing](/d4m-nfs/examples/img/d4m-default-file-sharing.png?raw=true "D4M Default File Sharing")

Please make sure that /tmp is still shared:
![D4M Minimal File Sharing](/d4m-nfs/examples/img/d4m-min-file-sharing.png?raw=true "D4M Minimal File Sharing")
