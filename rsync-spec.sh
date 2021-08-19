#!/bin/bash

rsync -avzP -e ssh ubuntu@10.10.72.159:~/rpmbuild/SPECS/ ~/rpmbuild/SPECS/
rsync -avzP ~/rpmbuild/SPECS/ -e ssh ubuntu@10.10.72.159:~/rpmbuild/SPECS/
