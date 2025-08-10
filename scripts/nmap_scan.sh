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
