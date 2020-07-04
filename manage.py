#!/usr/bin/env python

from subprocess import call
import sys
args = sys.argv
args[0] = args[0].replace('manage.py', 'web/app/manage.py')
call(args)