#/bin/sh

set -e

echo "------------------------------"
echo "Destroying the cluster"
echo "------------------------------"

cd vagrant && vagrant destroy -f

echo "------------------------------"
echo "Completed destroying the cluster"
echo "------------------------------"
