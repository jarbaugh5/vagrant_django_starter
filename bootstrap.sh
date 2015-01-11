#!/bin/sh

# Get Python3 and virtualenv
sudo apt-get update
sudo apt-get install -y python3-minimal
sudo apt-get install -y python-virtualenv

# Remove any former virtual environment
VENV_DIR=/vagrant/env
if [ -d "$VENV_DIR" ]; then
    rm -rf ${VENV_DIR}
fi

# Create a new virtual environment
virtualenv -p `which python3` /vagrant/env

# Install dependencies
REQ_FILE=/vagrant/requirements.txt
PIP_FILE=${VENV_DIR}/bin/pip
if [ -f "$REQ_FILE" ]; then
    ${PIP_FILE} install -r ${REQ_FILE}
fi