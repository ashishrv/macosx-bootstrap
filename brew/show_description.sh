#!/bin/bash

cat brew_packages.txt | xargs -I @ brew desc @ >> descriptions.txt

