#!/usr/bin/python
#This file runs the default build_runner command
import os
cmd = "flutter pub run build_runner build --delete-conflicting-outputs";
os.system(cmd);