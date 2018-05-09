#!/bin/bash

CONF_FILE=${CONF_FILE:-/etc/foundationdb/foundationdb.conf}

/usr/lib/foundationdb/fdbmonitor --conffile ${CONF_FILE}
