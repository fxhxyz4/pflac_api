#!/bin/bash

pip install -r requirements.txt --break-system-packages
uvicorn app:app --reload --host 0.0.0.0 --port 8000