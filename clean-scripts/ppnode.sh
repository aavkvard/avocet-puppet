#!/bin/bash
# This bash script holds the commands to scrub
# an app server and start fresh.

# Stop the app server.
svcadm disable node-sakai-oae

# Delete the directory.
sudo rm -rf /opt/oae
sudo rm -rf /opt/3akai-ux

# Pull latest puppet config and apply it.
# This will also start the node process again.
cd /root/puppet-hilary
bin/pull.sh
sudo bin/apply.sh
