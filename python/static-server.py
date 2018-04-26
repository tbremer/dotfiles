#!/usr/bin/env python
"""
Modification of `python -m SimpleHTTPServer` with a fallback to /index.html
on requests for non-existing files.
This is useful when serving a static single page application using the HTML5
history API.
"""

from http.server import BaseHTTPRequestHandler, HTTPServer
import os
import sys
import urllib

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
print("Server Starts - http://%s:%s" % (host, port))


try:
  myServer.serve_forever()
except KeyboardInterrupt:
  pass

myServer.server_close()
print("Server Stopped - http://%s:%s" % (host, port))
