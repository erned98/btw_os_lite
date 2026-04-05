#!/usr/bin/env bash

awk '
/<entry>/      { entry=1; buf=$0 ORS; next }
entry          { buf=buf $0 ORS }
/<\/entry>/    {
    if (buf !~ /\/shorts\//) printf "%s", buf
    entry=0; buf=""
    next
}
!entry         { print }
'

