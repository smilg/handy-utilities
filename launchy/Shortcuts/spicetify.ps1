# updates/reapplies spicetify - needed each time Spotify updates. spicetify can be found here: https://github.com/khanhas/spicetify-cli

Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
spicetify config extensions dribbblish.js fullAppDisplay.js webnowplaying.js shuffle+.js
spicetify config current_theme Dribbblish color_scheme purple
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify restore backup
spicetify backup apply

# $StartTime = $(get-date)
# $ElapsedTime = 0
# Write-Host "Waiting for Spotify to launch..." -NoNewline
# while (!(get-process | ?{$_.path -eq "$env:USERPROFILE\AppData\Roaming\Spotify\Spotify.exe"})) {
#     $ElapsedTime = ($(get-date).Ticks - $StartTime.Ticks)/10000000
#     if ($ElapsedTime -gt 10) {
#         Write-Output "Timed out! Something probably went wrong. Exiting in 2 seconds."
#         Start-Sleep -Seconds 2
#         exit
#     }
#     Write-Host "." -NoNewline
#     Start-Sleep -Seconds 1
# }
# Write-Host ""
# Write-Host "Spotify launched! Restarting with transparent window controls..."
# if (get-process | ?{$_.path -eq "$env:USERPROFILE\AppData\Roaming\Spotify\Spotify.exe"}){
#     Stop-Process -Name Spotify
#     Start-Sleep -Seconds 1
#     Invoke-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Spotify.lnk"
# }
# Write-Host "Done!"
# Start-Sleep -Seconds 1