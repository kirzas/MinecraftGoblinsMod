[CmdletBinding()]
Param(
    [Parameter()]
    [Setting]$Settings = (. $PSScriptRoot\Import-ZuZSetting.ps1)
)

$minecraftPath = $Settings.MinecraftPath
$testWorldName = $Settings.TestWorldName
$repositoryPath = $Settings.RepositoryPath
$packName = $Settings.PackName

$worldPath = Join-Path -Path $minecraftPath -ChildPath $testWorldName 

$destinations = @(
    $minecraftPath
    $worldPath
)

$buildFolderRelativePath = 'build'

$packTypes = @(
    'resource'
    'behavior'
)

if (-not (Test-Path -Path $minecraftPath)) {
    throw "Minecraft installation folder $minecraftPath does not exist"
}

$buildFolderPath = Join-Path -Path $repositoryPath -ChildPath $buildFolderRelativePath

if (-not (Test-Path -Path $buildFolderPath)) {
    throw "Build folder $buildFolderPath does not exist"
}
foreach ($destination in $destinations) {
    foreach ($type in $packTypes) {
        $sourcePackTypeSubfolderPath = Join-Path -Path $repositoryPath -ChildPath $buildFolderRelativePath -AdditionalChildPath "${type}_$packName.mcpack"
    
        $destinationPackTypeSubfolderPath = Join-Path -Path $destination -ChildPath "${type}_packs"
        $destinationPackTypeFullPath = Join-Path -Path $destinationPackTypeSubfolderPath -ChildPath $packName

        Remove-Item -Path $destinationPackTypeFullPath -Force -Recurse

        Expand-Archive -Path $sourcePackTypeSubfolderPath -Destination $destinationPackTypeFullPath -Force
    }
}