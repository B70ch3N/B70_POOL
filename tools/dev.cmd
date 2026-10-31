@echo off
rem Start the local preview server: http://127.0.0.1:4000/
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0dev.ps1" %*
