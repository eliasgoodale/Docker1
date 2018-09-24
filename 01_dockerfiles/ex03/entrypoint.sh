#!/bin/bash
/opt/gitlab/embedded/bin/runsvdir-start&
initctl start gitlab-runsvdir
EXTERNAL_URL="localhost" gitlab-ctl reconfigure
gitlab-ctl restart
while true; do sleep 1000; done
