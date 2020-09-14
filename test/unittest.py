#!/usr/bin/env python
import httplib
c = httplib.HTTPConnection('http://35.188.146.83:5000')
c.request("HEAD", '')
if c.response().status == 200:
    return 1
else
    return 0

