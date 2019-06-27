#/bin/sh

set -e

echo "------------------------------"
echo "Launching the VMs"
echo "------------------------------"

cd vagrant && vagrant up

cd ../ansible

echo "------------------------------"
echo "Completed launching the the VMs"
echo "------------------------------"
echo "Setting up the MongoDB cluster"
echo "------------------------------"

ansible-playbook ./t_vnt_cluster.yml --extra-vars "mongo_usr=$mongo_usr mongo_pw=$mongo_pw" -i inventory/vagrant_inventory.ini

echo "------------------------------"
echo "Completed cluster setup"
echo "------------------------------"


