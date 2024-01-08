[CmdletBinding()]
Param(
    [Parameter()]
    [Setting]$Settings = (. $PSScriptRoot\Import-ZuZSetting.ps1)
)

$repositoryPath = $Settings.RepositoryPath
$packName = $Settings.PackName

$destinationFolderName = 'build'

$packTypes = @(
    'resource'
    'behavior'
)

$destinationFolderPath = Join-Path -Path $repositoryPath -ChildPath $destinationFolderName
if (-not (Test-Path -Path $destinationFolderPath)) {
    $null = New-Item -Path $destinationFolderPath -ItemType Directory
}

foreach ($type in $packTypes) {
    $sourceSubfolderPath = Join-Path -Path $repositoryPath -ChildPath "${type}_packs"
    $sourceFullPath = Join-Path -Path $sourceSubfolderPath -ChildPath "$packName\*"
    $destinationFullPath = Join-Path -Path $destinationFolderPath -ChildPath "${type}_$packName.zip"
    $finalFileName = "${type}_$packName.mcpack"
    $finalFilePath = $destinationFullPath = Join-Path -Path $destinationFolderPath -ChildPath $finalFileName
    if (Test-Path -Path $finalFilePath) {
        Remove-Item -Path $finalFilePath
    }

    Compress-Archive -Path $sourceFullPath -DestinationPath $destinationFullPath -CompressionLevel NoCompression -Force
    Rename-Item -Path $destinationFullPath -NewName $finalFileName
}

