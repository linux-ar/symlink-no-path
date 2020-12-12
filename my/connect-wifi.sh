#!/bin/bash
#dependency : package networkmanager


nmcli device wifi connect $1 password $2 
