# Geronzio
Geronzio is a nice guy.

## Description

Geronzio inits and renews Kerberos tickets for you.

Geronzio is a bit sticky, he espects to be carried around in a sidecar container.

## Status

[![Docker Image CI](https://github.com/pilillo/geronzio/actions/workflows/docker-ci.yml/badge.svg?branch=main)](https://github.com/pilillo/geronzio/actions/workflows/docker-ci.yml)

## Usage

In this [blog post](http://p111110.blogspot.com/2021/03/kerberos-auth-on-k8sopenshift-using.html), we show how Geronzio can be used as sidecar Kerberos auth manager on K8s deployments.

For Jobs you can use a classic kinit as follows:

`kinit -kt keytab user@REALM`

Below the full help:

```
Usage: kinit [-V] [-l lifetime] [-s start_time]
	[-r renewable_life] [-f | -F | --forwardable | --noforwardable]
	[-p | -P | --proxiable | --noproxiable]
	-n [-a | -A | --addresses | --noaddresses]
	[--request-pac | --no-request-pac]
	[-C | --canonicalize]
	[-E | --enterprise]
	[-v] [-R] [-k [-i|-t keytab_file]] [-c cachename]
	[-S service_name] [-T ticket_armor_cache]
	[-X <attribute>[=<value>]] [principal]

    options:
	-V verbose
	-l lifetime
	-s start time
	-r renewable lifetime
	-f forwardable
	-F not forwardable
	-p proxiable
	-P not proxiable
	-n anonymous
	-a include addresses
	-A do not include addresses
	-v validate
	-R renew
	-C canonicalize
	-E client is enterprise principal name
	-k use keytab
	-i use default client keytab (with -k)
	-t filename of keytab to use
	-c Kerberos 5 cache name
	-S service
	-T armor credential cache
	-X <attribute>[=<value>]
```

For long lasting deployments that need to periodically renew the ticket, you can use the k5start utility, for instance:

`k5start -f keytab.file -u user@REALM -v -K 60 -x`

Below the full help:

```
Usage: k5start [options] [name [command]]
   -u <client principal>        (default: local username)
   -i <client instance>         (default: null)
   -S <service name>            (default: krbtgt)
   -I <service instance>        (default: realm name)
   -r <service realm>           (default: local realm)

   -a                   Renew on each wakeup when running as a daemon
   -b                   Fork and run in the background
   -c <file>            Write child process ID (PID) to <file>
   -F                   Force non-forwardable tickets
   -f <keytab>          Use <keytab> for authentication rather than password
   -g <group>           Set ticket cache group to <group>
   -H <limit>           Check for a happy ticket, one that doesn't expire in
                        less than <limit> minutes, and exit 0 if it's okay,
                        otherwise obtain a ticket
   -h                   Display this usage message and exit
   -K <interval>        Run as daemon, check ticket every <interval> minutes
                        (implies -q unless -v is given)
   -k <file>            Use <file> as the ticket cache
   -L                   Log messages via syslog as well as stderr
   -l <lifetime>        Ticket lifetime in minutes
   -m <mode>            Set ticket cache permissions to <mode> (octal)
   -o <owner>           Set ticket cache owner to <owner>
   -P                   Force non-proxiable tickets
   -p <file>            Write process ID (PID) to <file>
   -q                   Don't output any unnecessary text
   -s                   Read password on standard input
   -t                   Get AFS token via aklog or AKLOG
   -U                   Use the first principal in the keytab as the client
                        principal and don't look for a principal on the
                        command line
   -v                   Verbose
   -x                   Exit immediately on any error
```
