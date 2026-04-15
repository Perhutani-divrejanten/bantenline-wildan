$pattern1 = 'Warta Jabar'
$replacement1 = 'BantenLine'
$pattern2 = 'warta jabar'
$replacement2 = 'bantenline'

$files = Get-ChildItem -Path 'd:\Magang\Perhutani\BantenLine' -Filter '*.html' -Recurse

$count = 0
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $newContent = $content
    
    if ($content.Contains($pattern1)) {
        $newContent = $newContent.Replace($pattern1, $replacement1)
        $count++
    }
    
    if ($newContent.Contains($pattern2)) {
        $newContent = $newContent.Replace($pattern2, $replacement2)
    }
    
    if ($newContent -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $newContent)
        Write-Host "Updated: $($file.Name)"
    }
}
Write-Host "Total files updated: $count"
