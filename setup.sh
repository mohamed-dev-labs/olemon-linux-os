#!/bin/bash

# Olemon Linux Optimization Script
# Purpose: Lightweight, Fast, and Sandbox-ready environment

echo "--- Optimizing Olemon Linux Environment ---"

# Update and Clean
sudo apt update
sudo apt install -y --no-install-recommends curl git ca-certificates

# Performance Tweaks (CPU/GPU focus for WSL)
echo "export OLEMON_VERSION='1.0.0'" >> ~/.bashrc
echo "export PS1='\[\033[01;31m\](olemon-sandbox)\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc

# Sandbox Tools (Minimalist)
sudo apt install -y htop screen

# Custom Olemon Command
echo 'alias olemon-info="echo Olemon Linux: Lightweight & Fast Sandbox Environment"' >> ~/.bashrc

echo "Optimization Complete. Please restart your terminal."
