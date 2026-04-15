$pattern = '<img src="img/warta jabar.png" alt="Warta Jabar">'
$replacement = '<span class="brand-logo">BantenLine</span>'
$files = Get-ChildItem -Path 'd:\Magang\Perhutani\BantenLine' -Filter '*.html' -Recurse

$count = 0
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    if ($content.Contains($pattern)) {
        $newContent = $content.Replace($pattern, $replacement)
        [System.IO.File]::WriteAllText($file.FullName, $newContent)
        $count++
        Write-Host "Updated: $($file.Name)"
    }
}
Write-Host "Total files updated: $count"
