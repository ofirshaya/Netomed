#!/usr/bin/env python
import requests
def check_status():
    c = requests.get('http://35.188.146.83:80')
    if '200' in str(c): 
        return 1
    else:
        return 0

check_status()
