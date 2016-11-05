goapp Cookbook
==============
This cookbook deploys a sample [(Go)](https://golang.org/) application ([sample-application-go](https://github.com/ashokm/sample-application-go)).

Requirements
------------

### Platform
Tested on:

* Ubuntu Server 14.04

#### Cookbooks
- `golang` - depends on this cookbook to get and install our Go package.
- `supervisor` - depends on this cookbook to manage our Go application service and processes.

Attributes
----------
* `['goapp']['name']` - , default is 'sample-application-go'
* `['goapp']['user']` - , default is 'gouser'
* `['goapp']['package']` - , default is 'github.com/ashokm/sample-application-go'

Usage
-----
#### goapp::default

Just include `goapp` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[goapp]"
  ]
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
