#!/bin/bash

export PATH=$PATH:/marytts

cd marytts && marytts server &

cd /home_automation/kalliope && kalliope start
