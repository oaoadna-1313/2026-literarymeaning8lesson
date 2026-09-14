# 文意新8課 - 一鍵推送到 GitHub 腳本
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host "正在準備推送到 GitHub..." -ForegroundColor Cyan

$env:PATH = "C:\Program Files\Git\cmd;C:\Program Files\Git\bin;C:\Program Files\Git\mingw64\bin;" + $env:PATH
Set-Location -LiteralPath $PSScriptRoot

git status
git add .
git commit -m "feat: update courseware for GitHub Pages" --allow-empty

Write-Host "`n>>> 正在推送到遠端儲存庫，若跳出 GitHub 登入視窗請點擊 Sign in 授權... <<<`n" -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n==========================================" -ForegroundColor Green
    Write-Host "恭喜！教材已成功推送到 GitHub！" -ForegroundColor Green
    Write-Host "請至 GitHub 倉庫開啟 Pages 服務即可全班上線！" -ForegroundColor Yellow
    Write-Host "==========================================" -ForegroundColor Green
} else {
    Write-Host "`n==========================================" -ForegroundColor Red
    Write-Host "推送尚未成功（代碼: $LASTEXITCODE）。" -ForegroundColor Red
    Write-Host "可能原因：GitHub 尚未授權登入，或當前登入的帳號無寫入權限。" -ForegroundColor Yellow
    Write-Host "==========================================" -ForegroundColor Red
}
