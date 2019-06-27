# Ansible Vagrant MongoDB Cluster

Deploy a local `MongoDB 4.0.10` cluster with a single command.

### Cluster topology

![MongoDB minimal cluste topology](./cluster.svg)

### Configuration

+ 1 Mongos / router
+ 1 Config server
+ 1 Shard with 3 nodes
  + 2 in replication
  + 1 arbiter

## Usage

### Requirements

+ [Install Vagrant](https://www.vagrantup.com/docs/installation/)
+ [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)


### Setup

If you already have Vagrant and Ansible installed, then you just need to configure the network interface for `Virtualbox` to bind to.

To get a list of network interfaces

```bash
$ vboxmanage list bridgedifs
```

Then choose the one you want, for example `enp2s0` and

```bash
$ export NETINT=enp2s0
```

That will be used by the `Vagrantfile` to bind the virtual machines.

Note: If your local network is not in the `192.168...` range, you might need to edit the `Vagrantfile` and the ansible inventory.

---

Set a `username` and `password` for the cluster

```bash
$ export mongo_usr=username
$ export mongo_pw=hunter2
```

### Run it

If you have everything installed and you're running on OSx/Ubuntu, just run

```
$ ./run.sh
```

That should boot up the VMs and provision the whole cluster in just a few minutes, depending on the hardware.

### Try it

``` bash
$ mongo --host 192.168.18.19:27017 -u 'username' -p 'hunter2' --authenticationDatabase 'admin'

MongoDB shell version v4.0.10                                    
connecting to: mongodb://192.168.18.19:27017/?authSource=admin&gssapiServiceName=mongodb                                                  
Implicit session: session { "id" : UUID("02ce446b-b36c-48e2-8566-49e52abeb8d9") }  
MongoDB server version: 4.0.10

mongos> db.adminCommand({ listShards: 1})                             
{
  shards: [
    {
      _id: "sh0rs0",
      host: "sh0rs0/arbiter:27017,sh0n0:27017,sh0n1:27017",
      state: 1
    }
  ],
  ok: 1,
  operationTime: Timestamp(1561660870, 1),
  $clusterTime: {
    clusterTime: Timestamp(1561660870, 1),
    signature: {
      hash: BinData(0, "M0hV9SM4WXx8NvUOMIurqT0N6gY="),
      keyId: NumberLong("6707282265308659713")
    }
  }
}; 

```

## Other commands

Destroy the cluster

```
$ ./destroy.sh 
```

Reset the cluster

```
$ ./reset.sh 
```

That will destroy and re-create the cluster from scratch

---

CONTRIBUTIONS: YES

LICENSE: MIT
