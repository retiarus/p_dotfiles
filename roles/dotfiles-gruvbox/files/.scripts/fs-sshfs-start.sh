#!/bin/bash

sshfs -o reconnect,transform_symlinks,ssh_command='autossh -M 0' peregrinus@falco03.falco.net:/home/peregrinus /mnt/falco03/home
sshfs -o reconnect,transform_symlinks,ssh_command='autossh -M 0' peregrinus@falco05.falco.net:/home/peregrinus /mnt/falco05/home
