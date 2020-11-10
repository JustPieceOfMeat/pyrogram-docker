#!/bin/bash

if test -f "requirements.txt"; then
    pip install -r requirements.txt
fi

python main.py