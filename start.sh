#!/bin/bash

pip install pyrogram

if test -f "requirements.txt"; then
    pip install -r requirements.txt
fi

python main.py