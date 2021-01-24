#!/bin/bash

pip install https://github.com/pyrogram/pyrogram/archive/master.zip

if test -f "requirements.txt"; then
    pip install -r requirements.txt
fi

python main.py