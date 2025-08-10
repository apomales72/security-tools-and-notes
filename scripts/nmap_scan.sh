#!/bin/bash

# Simple Nmap scan script

# Check if target IP or hostname is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <target>"
  echo "Example: $0 192.168.1.1"
  exit 1
fi

TARGET=$1
OUTPUT_FILE="nmap_scan_${TARGET}_$(date +%Y%m%d_%H%M%S).txt"

echo "Starting Nmap scan on target: $TARGET"
echo "Output will be saved to: $OUTPUT_FILE"

# Run a basic Nmap scan with common options
nmap -sS -sV -O -T4 $TARGET > "$OUTPUT_FILE"

echo "Scan complete."
echo "Results saved in $OUTPUT_FILE"

# What it does:

# Takes a target IP address or hostname as an argument

# Runs a SYN scan (-sS), version detection (-sV), and OS detection (-O)

# Uses faster timing template (-T4) for speed

# Saves the results to a timestamped text file for easy reference

# Prints basic usage info if no argument is provided

# How to use it:

# chmod +x nmap_scan.sh
# ./nmap_scan.sh 192.168.1.1
