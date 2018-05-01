#!/bin/bash
# wait-for-mysql.sh
# Taken from https://docs.docker.com/compose/startup-order/

set -e

host="$1"
shift
cmd="$@"

until mysql --host="$host" --password=$MYSQL_PASSWORD --user=$MYSQL_USER --execute='\q'; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
sleep 1
exec $cmd
