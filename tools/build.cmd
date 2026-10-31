@echo off
rem Clean build into public/
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build.ps1" %*
