# Docker Dev Environment

## Installation

### Install Docker for Mac

[Download the latest stable release](https://download.docker.com/mac/stable/Docker.dmg)

### Configure D4M file sharing

We are going to handle mounting volumes using `d4m-nfs` for a nice speed boost. You will need to set the file sharing preferences in Docker for Mac D4M Preferences -> File Sharing to only share `/tmp`

This is the default file sharing:
![D4M Default File Sharing](https://github.com/julianfann/d4m-nfs/blob/master/examples/img/d4m-default-file-sharing.png?raw=true "D4M Default File Sharing")

Please make sure that /tmp is still shared:
![D4M Minimal File Sharing](https://github.com/julianfann/d4m-nfs/blob/master/examples/img/d4m-min-file-sharing.png?raw=true "D4M Minimal File Sharing")

### Configure environment

#### Add .env file

Copy the `.env-example` to `.env` and updated the `PROJECTS_PATH` variable to point to the directory that contains your projects. This should be a relative path from your home directory. eg. `/Users/yourusername/projects` becomes `../projects`.

#### Setup your virtual hosts

**Apache2:**
Copy `.docker/httpd/conf/hosts/host.conf.example` to `.docker/httpd/conf/hosts/yourhostname.conf` and update with your specifics.

**Nginx:**
Copy `.docker/nginx/conf/hosts/host.conf.example` to `.docker/nginx/conf/hosts/yourhostname.conf` and update with your specifics.

There are containers for both PHP 5.6 and PHP 7. The docker network ip addresses are aliased as `php56` and `php7`, so to use fast-cgi you would reference the instances as follows:

**Apache with PHP 5.6:**
```
<FilesMatch \.php$>
    SetHandler "proxy:fcgi://php56:9000"
</FilesMatch>
```
**Apache with PHP 7:**
```
<FilesMatch \.php$>
    SetHandler "proxy:fcgi://php7:9000"
</FilesMatch>
```
**Nginx with PHP 5.6:**
```
location ~ \.php$ {
    try_files $uri =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass php56:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param PATH_INFO $fastcgi_path_info;
}
```
**Nginx with PHP 7:**
```
location ~ \.php$ {
    try_files $uri =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass php7:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param PATH_INFO $fastcgi_path_info;
}
```

### Start using the Makefile

Run `make up` to run `./d4m-nfs/d4m-nfs.sh && docker-compose up -d`. This will mount your shared folders as nfs mounts and then run docker-compose in detatched mode. These commands can be run separately if needed.

Run 'make down' which runs 
