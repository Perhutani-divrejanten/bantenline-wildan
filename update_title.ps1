$pattern1 = 'Warta Janten'
$replacement1 = 'BantenLine'

$files = Get-ChildItem -Path 'd:\Magang\Perhutani\BantenLine' -Filter '*.html' -Recurse

$count = 0
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    if ($content.Contains($pattern1)) {
        $newContent = $content.Replace($pattern1, $replacement1)
        [System.IO.File]::WriteAllText($file.FullName, $newContent)
        $count++
        Write-Host "Updated: $($file.Name)"
    }
}
Write-Host "Total files updated: $count"
