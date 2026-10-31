@echo off
rem Create a new post: tools\new-post.cmd -Title "标题"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0new-post.ps1" %*
