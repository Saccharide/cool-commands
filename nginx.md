# nginx

## Installation
```
sudo apt update
sudo apt install nginx -y
```
* Enable `ufw`, uncomplicated firewall
```
sudo ufw enable
```

* Check available applications
```
sudo ufw app list
```

* Check if `nginx` is working or not
```bash
sudo systemctl status nginx
```

## Configuration
* Configuration directory in `/etc/nginx`
* `sites_available` contains configuration files for all the available sites.
* `sites_enabled` contains the links to the configuration files that `nginx` will read and run.

### Steps to do
1. Create a configuration file in `sites_available` for our test site
2. Create a symbolic link to that file in `sites_enabled` so that `nginx` knows and will be able to run it.

* Sample `nginx` configuration file, `treasury`
```
server {
    listen 80 default_server;
    listen [::] default_server;
    root /var/www/html;
    index index.php;
    server_name treasury;
    location / {
        try_files $uri $uri/ =404;
    }
}
```

* We then create a symlink with `sudo ln -s ../sites-available/treasury treasury`
* We need to make sure that there is only one file in `sites_enabled` for each port, or else it won't work as expected.

3. Restart `nginx` with `sudo systemctl restart nginx`

### Configure PHP fpm with `nginx`

* Add the following to the `server` block in the above configuration file
```
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;

		# With php-fpm (or other unix sockets):
		fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
	}
```
* Make sure to clear browser cache or load `127.0.0.1` in incognito mode to reflect changes in `127.0.0.1` to root path
