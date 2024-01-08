
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$RepositoryPath = (Join-Path -Path $PSScriptRoot -ChildPath '..\'),

        [Parameter()]
        [string]$SettingsFileRelativePath = 'build_scripts',

        [Parameter()]
        [string]$SettingsFileName = 'settings.json',

        [Parameter()]
        [Setting]$Settings
    )

    $classesPath = Join-Path $RepositoryPath -ChildPath build_scripts -AdditionalChildPath *.class.ps1

    . $classesPath

    $settingsPath = Join-Path -Path $RepositoryPath -ChildPath 'build_scripts' -AdditionalChildPath $SettingsFileName

    if (-not (Test-Path -Path $settingsPath)) {

        $finalSettings = if ($Settings) {
            $Settings
        } else {
            [Setting]@{
                RepositoryPath = $RepositoryPath
            }
        }
        
        Set-Content -Path $settingsPath -Value (ConvertTo-Json -InputObject $finalSettings -Depth 2) -ErrorAction Stop
    }

    New-Item -Path $RepositoryPath -Name build -ItemType Directory -ErrorAction Stop
