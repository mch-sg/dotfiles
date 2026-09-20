#!/bin/bash
input="$*"
conda create -n $input python=3.13
conda activate $input
depn
