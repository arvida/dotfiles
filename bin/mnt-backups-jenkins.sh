#!/usr/bin/env bash

sshfs backups@jenkins.oktavilla.se:/home/backups/ ~/mnt/backups-at-jenkins -oauto_cache,reconnect,defer_permissions,negative_vncache,follow_symlinks,volname=backups-jenkins
