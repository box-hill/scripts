# Get-AudioDevice -List
# Set windows to run ps scripts by default: 
# https://superuser.com/questions/266518/running-windows-powershell-scripts-simply-opens-it-in-the-editor
# 
$speakerId = '{0.0.0.00000000}.{2dfb92fe-5361-4abf-9595-3bf45e332859}'
$headphonesId = '{0.0.0.00000000}.{0562d906-9948-4645-bc92-e682ae884ec4}'
#$microphoneId = '{0.0.1.00000000}.{a24d9cc3-0562-43ad-a3f3-55d4a4cf5a85}'

# check if speaker currently in use.
# if not, then switch speakers.
# else use headphones

$currentSpeaker = Get-AudioDevice -id $speakerId


if ($currentSpeaker.Default -and $currentSpeaker.DefaultCommunication)
{
    Set-AudioDevice -ID $headphonesId
}
else
{
    Set-AudioDevice -ID $speakerId
}