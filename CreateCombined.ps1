$sourceFolder = "D:\GitHub\JanStaelens.github.io\_posts"
$outputFile   = "D:\GitHub\JanStaelens.github.io\combined.md"

# Get all .md files sorted by LastWriteTime
$files = Get-ChildItem -Path $sourceFolder -Filter *.md | Sort-Object LastWriteTime

# Clear or create the output file
"" | Out-File -FilePath $outputFile -Encoding utf8

foreach ($file in $files) {
    Add-Content -Path $outputFile -Value "`n---`n# $($file.Name)`n---`n"
    Get-Content -Path $file.FullName | Add-Content -Path $outputFile
}
