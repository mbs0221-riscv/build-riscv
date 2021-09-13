#!/bin/bash

rsync -avzP -e 'dbclient -y -p 2222' root@vc709:/tmp/benchmark/ ~/benchmark/
