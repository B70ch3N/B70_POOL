@echo off
rem Build, commit and push: tools\publish.cmd -Message "说明"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0publish.ps1" %*
