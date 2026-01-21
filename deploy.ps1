# GitHub 저장소 생성 및 푸시 스크립트

$repoName = "cursor-claude-website"
$username = "spfe0"  # GitHub 사용자명으로 변경 필요

Write-Host "GitHub 저장소 생성 중..." -ForegroundColor Yellow

# GitHub API를 사용한 저장소 생성 (토큰 필요)
# $token = "YOUR_GITHUB_TOKEN"
# $headers = @{Authorization = "token $token"}
# $body = @{
#     name = $repoName
#     description = "Cursor Claude 웹사이트"
#     private = $false
# } | ConvertTo-Json
# 
# Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $body

Write-Host "`n수동으로 저장소를 만드신 후, 아래 명령어를 실행하세요:" -ForegroundColor Cyan
Write-Host "git remote add origin https://github.com/$username/$repoName.git" -ForegroundColor Green
Write-Host "git push -u origin main" -ForegroundColor Green

# 또는 저장소가 이미 있다면:
Write-Host "`n저장소가 이미 있다면 바로 푸시합니다..." -ForegroundColor Yellow

cd $PSScriptRoot

# 원격 저장소 확인
$remoteExists = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "원격 저장소가 설정되어 있습니다: $remoteExists" -ForegroundColor Green
    Write-Host "푸시 중..." -ForegroundColor Yellow
    git push -u origin main
} else {
    Write-Host "원격 저장소가 설정되지 않았습니다." -ForegroundColor Red
    Write-Host "GitHub에서 저장소를 만든 후, 다음 명령어를 실행하세요:" -ForegroundColor Yellow
    Write-Host "git remote add origin https://github.com/$username/$repoName.git" -ForegroundColor Cyan
    Write-Host "git push -u origin main" -ForegroundColor Cyan
}
