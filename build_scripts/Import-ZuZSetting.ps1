[CmdletBinding()]
Param(
    [Parameter()]
    [string]$RepositoryPath = (Join-Path -Path $PSScriptRoot -ChildPath '..\'),

    [Parameter()]
    [string]$SettingsFileRelativePath = 'build_scripts',

    [Parameter()]
    [string]$SettingsFileName = 'settings.json'
)

$settingsPath = Join-Path -Path $RepositoryPath -ChildPath 'build_scripts' -AdditionalChildPath $SettingsFileName

Get-Content -Path $settingsPath -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
