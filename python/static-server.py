#!/usr/bin/env python3

"""
Static file server with History API fallback
"""

from http.server import BaseHTTPRequestHandler, HTTPServer
import os
import sys
import urllib
import time

host = '0.0.0.0'

try:
  port = int(sys.argv[1])
except IndexError:
  port = 8000

class Handler(BaseHTTPRequestHandler):
  def do_GET(self):
    self.send_response(200)
    self.send_header("Content-type", "text/html")
    self.end_headers()

    urlparts = urllib.parse.urlparse(self.path)
    request_file_path = urlparts.path.strip('/')

    try:
      with open(request_file_path, 'rb') as file:
        self.wfile.write(file.read())
    except Exception as e:
      with open('index.html', 'rb') as file:
        self.wfile.write(file.read())

myServer = HTTPServer((host, port), Handler)
print(time.asctime(time.localtime()))
print("Server Starts - http://%s:%s" % (host, port))
print("----")


try:
  myServer.serve_forever()
except KeyboardInterrupt:
  print("")
  pass

myServer.server_close()

print("----")
print(time.asctime(time.localtime()))
print("Server Stopped - http://%s:%s" % (host, port))
print("----")
