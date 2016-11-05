### Description

This is a self-contained project which will provision a fully virtualized environment containing 1 web server and 2 application servers as defined in [Vagrantfile](Vagrantfile)

A sample [(Go)](https://golang.org/) application ([sample-application-go](https://github.com/ashokm/sample-application-go)) will be deployed to the application servers.

[NGINX](https://www.nginx.com/resources/wiki/) will be installed and configured on the web server using a [round-robin load balancing](https://www.nginx.com/resources/glossary/round-robin-load-balancing/) method to distribute client requests across the application servers.

### Technology stack:

* [Vagrant](https://www.vagrantup.com/) - creates and configures virtual development environments.
* [VirtualBox](https://www.virtualbox.org/) - virtualization software package.
* [Chef](https://www.chef.io/chef/) - configuration management tool written in Ruby and Erlang.
* [Go](https://golang.org/) - also commonly referred to as golang, is a programming language developed at Google in 2007.
* [NGINX](https://www.nginx.com/resources/wiki/) - a free, open-source, high-performance HTTP server and reverse proxy, as well as an IMAP/POP3 proxy server.
* [Supervisor](http://supervisord.org/) - a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.


### Tested on:

* Ubuntu Server 14.04

### Installation

Please install the latest version of [Vagrant](https://docs.vagrantup.com/v2/installation/). And because we'll be using [VirtualBox](https://www.virtualbox.org/) as our provider, please install that as well.

### Launch
```
$ vagrant up
```

After running the above command, you'll have a fully running virtual environment in VirtualBox running 3x Ubuntu Server 14.04 LTS 64-bit servers as defined in the [Vagrantfile](Vagrantfile).

### Verify

#### Debugging
You can SSH into these machines using `vagrant ssh (web01|app01|app02)` if you need to.

#### Application Servers
You can verify the sample Go application is running on the application servers via [http://192.168.50.5:8484](http://192.168.50.5:8484) and [http://192.168.50.6:8484](http://192.168.50.6:8484)

#### Web Server
You can verify the web server is successfully distributing client requests across the application servers via [http://192.168.50.4](http://192.168.50.4)

### Terminate
You can remove all traces of this virtual environment with `vagrant destroy -f`.

### Future Enhancements
* Add Test Kitchen to goapp and loadbalancer cookbooks and plug into Travis CI

### Cheatsheet

* [Supervisor](http://supervisord.org/)
  * Config file is located here: `/etc/supervisor.d/sample-application-go.conf`
  * Restart application server service using: `sudo supervisorctl restart sample-application-go`

### License and Authors
- Author:: Ashok Manji (<ashokmanji@hotmail.com>)
