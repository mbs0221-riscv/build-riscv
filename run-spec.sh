#!/bin/bash
# Usage:
#       ./run.sh example.spec

./convert.sh $1 | sed 's/.* in //' | xargs -i bash {}
