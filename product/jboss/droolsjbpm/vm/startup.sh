#!/bin/env sh

nohup /opt/wildfly-8.2.0.Final/bin/standalone.sh -b 0.0.0.0 -c standalone-full.xml > ~/log/wildfly.log 2>&1 2>&1 &
