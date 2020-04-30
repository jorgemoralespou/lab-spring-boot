#!/bin/bash

java -jar /opt/initializr/initializr.jar --initializr.project-location-container=/home/eduk8s --server.port=10189 > /opt/initializr/initializr-log.log 2>&1 &