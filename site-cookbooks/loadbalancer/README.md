loadbalancer Cookbook
==============
This cookbook installs [NGINX](https://www.nginx.com/resources/wiki/) and configures using a [round-robin load balancing](https://www.nginx.com/resources/glossary/round-robin-load-balancing/) method (by default) to distribute client requests across application servers.

Requirements
------------

### Platform
Tested on:

* Ubuntu Server 14.04

#### Cookbooks
- `nginx` - depends on this cookbook to install NGINX.

Attributes
----------
* `['loadbalancer']['balancing_method']` - , default is 'round_robin' (options are 'round_robin', least_conn, ip_hash)
* `['loadbalancer']['upstream_servers']` - , default is `nil` (must be an array of strings - see Usage section)

Usage
-----
#### loadbalancer::default

Just include `loadbalancer` in your node's `run_list`, specifying the `upstream_servers` and (optionally) the `balancing_method` required:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[loadbalancer]"
  ],
  "loadbalancer": {
      "upstream_servers": ["192.168.50.5:8484", "192.168.50.6:8484"],
      "balancing_method": "least_conn"
    },
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ashok Manji (<ashokmanji@hotmail.com>)
