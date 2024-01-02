$minecraftPath = 'C:\Users\Argel\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang'

$repositoryPath = 'C:\Users\Argel\Dev\MinecraftGoblinsMod'

$buildFolderRelativePath = 'build'

$packName = 'GoblinsMod'

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

foreach ($type in $packTypes) {
    $sourcePackTypeSubfolderPath = Join-Path -Path $repositoryPath -ChildPath $buildFolderRelativePath -AdditionalChildPath "${type}_$packName.mcpack"
    
    
    $destinationPackTypeSubfolderPath = Join-Path -Path $minecraftPath -ChildPath "${type}_packs"
    $destinationPackTypeFullPath = Join-Path -Path $destinationPackTypeSubfolderPath -ChildPath $packName

    Expand-Archive -Path $sourcePackTypeSubfolderPath -Destination $destinationPackTypeFullPath -Force
}
