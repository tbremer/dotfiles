echo "== Removing Node, NPM & N executables";

sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf /usr/local/lib/node
sudo rm -rf /usr/local/include/node_modules
sudo rm -rf /usr/local/include/node
sudo rm -rf $HOME/local/node_modules
sudo rm -rf $HOME/local/node
sudo rm -rf $HOME/lib/node_modules
sudo rm -rf $HOME/lib/node
sudo rm -rf $HOME/includes/node_modules
sudo rm -rf $HOME/includes/node
sudo rm -rf /usr/local/bin/node
sudo rm -rf /usr/local/bin/npm
sudo rm -rf /usr/local/share/man/man1/node.1
sudo rm -rf /usr/local/lib/dtrace/node.d
sudo rm -rf ~/.npm
sudo rm -rf ~/.node-gyp
sudo rm -rf /opt/local/bin/node
sudo rm -rf /opt/local/include/node
sudo rm -rf /opt/local/lib/node_modules
sudo rm -rf /usr/local/n
sudo rm -rf /usr/local/bin/n

echo "== Complete!"
