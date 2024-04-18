#!/usr/bin/env python3
import json
import sys

params = json.loads(sys.stdin.read())
message = params["message"]

# Rest of the code
print(f"{message} from python version {sys.version}!")
