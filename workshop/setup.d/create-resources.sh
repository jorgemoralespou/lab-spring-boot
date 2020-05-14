#!/bin/bash
pwd > /home/eduk8s/create-resources-dir
cd /opt
envsubst < workshop/content/exercises/step2.md.in > workshop/content/exercises/step2.md