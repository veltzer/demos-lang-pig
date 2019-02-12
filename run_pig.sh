#!/bin/sh

pig -x local -f "$1" 2> /dev/null
