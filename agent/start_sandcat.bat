@echo off
powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList '-ExecutionPolicy Bypass -WindowStyle Hidden -File \"C:\Users\Public\start_sandcat.ps1\"'"