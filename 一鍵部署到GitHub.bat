@echo off
chcp 65001 >nul
title 部署到 GitHub
echo ========================================================
echo   正在準備推送到 GitHub...
echo   若畫面彈出瀏覽器或登入視窗，請點擊授權登入即可！
echo ========================================================
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0deploy.ps1"
echo.
pause
