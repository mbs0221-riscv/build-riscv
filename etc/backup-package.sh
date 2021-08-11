#/bin/bash

rsync -avzP ~/rpmbuild/RPMS  -e 'dbclient -p 2222' root@vc709:/nfsroot/rpmbuild
rsync -avzP ~/rpmbuild/SPECS -e 'dbclient -p 2222' root@vc709:/nfsroot/rpmbuild

