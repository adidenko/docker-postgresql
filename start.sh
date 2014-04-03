#!/bin/bash

puppet apply -d -v /root/site.pp

service postgresql stop

sudo -u postgres /usr/bin/postmaster -p 5432 -D /var/lib/pgsql/data

