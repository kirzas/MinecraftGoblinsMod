[CmdletBinding()]
Param(
    [Parameter()]
    [string]$RepositoryPath = (Join-Path -Path $PSScriptRoot -ChildPath '..\'),

    [Parameter()]
    [string]$SettingsFileRelativePath = 'build_scripts',

    [Parameter()]
    [string]$SettingsFileName = 'settings.json',

    [Parameter()]
    [string]$SettingsClassFileName = 'Setting.class.ps1'
)
$buildScriptsPath = Join-Path -Path $RepositoryPath -ChildPath 'build_scripts'
$settingsPath =  Join-Path -Path $buildScriptsPath -ChildPath $SettingsFileName
$settingsClasPath = Join-Path -Path $buildScriptsPath -ChildPath $SettingsClassFileName

. $settingsClasPath

Get-Content -Path $settingsPath -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
