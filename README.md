# FoundationDB in a container

## What is this

This is [FoundationDB](https://github.com/apple/foundationdb/) in a Docker container running ubuntu:16.04. It should be used for development purposes only.

## Run

```bash
docker run -ti --rm --net=host jvassev/fdb:latest
Time="1525865769.139620" Severity="10" LogGroup="default" Process="fdbmonitor": Started FoundationDB Process Monitor 5.1 (v5.1.7)
Time="1525865769.148967" Severity="10" LogGroup="default" Process="fdbmonitor": Watching conf file /etc/foundationdb/foundationdb.conf
...
# output omitted

```

## Connect

```bash
# This will start fdbcli on its own o
make cli
docker run --net=host --rm -ti --entrypoint=fdbcli jvassev/fdb:latest
Using cluster file `/etc/foundationdb/fdb.cluster'.

The database is unavailable; type `status' for more information.

Welcome to the fdbcli. For help, type `help'.
fdb> status

Using cluster file `/etc/foundationdb/fdb.cluster'.

Configuration:
  Redundancy mode        - single
  Storage engine         - memory
  Coordinators           - 1

Cluster:
  FoundationDB processes - 1
  Machines               - 0
  Fault Tolerance        - 0 machines
  Server time            - 05/09/18 11:34:51

Data:
  Replication health     - (Re)initializing automatic data distribution
  Moving data            - unknown (initializing)
  Sum of key-value sizes - unknown
  Disk space used        - 0 MB

Operating space:
  Storage server         - 33.3 GB free on most full server
  Log server             - 33.3 GB free on most full server

Workload:
  Read rate              - 16 Hz
  Write rate             - 0 Hz
  Transactions started   - 0 Hz
  Transactions committed - 0 Hz
  Conflict rate          - 0 Hz

Backup and DR:
  Running backups        - 0
  Running DRs            - 0

Client time: 05/09/18 11:34:51

fdb>

```

## Configure

Mount a volume at /etc/foundationdb/ or point the `CONF_FILE` env var to a mounted volume.
