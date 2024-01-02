$minecraftPath = 'C:\Users\Argel\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang'
$worldPath = 'C:\Users\Argel\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\minecraftWorlds\TestWorld'

$destinations = @(
    $minecraftPath
    $worldPath
)

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
foreach ($destination in $destinations) {
    foreach ($type in $packTypes) {
        $sourcePackTypeSubfolderPath = Join-Path -Path $repositoryPath -ChildPath $buildFolderRelativePath -AdditionalChildPath "${type}_$packName.mcpack"
    
        $destinationPackTypeSubfolderPath = Join-Path -Path $destination -ChildPath "${type}_packs"
        $destinationPackTypeFullPath = Join-Path -Path $destinationPackTypeSubfolderPath -ChildPath $packName

        Remove-Item -Path $destinationPackTypeFullPath -Force -Recurse

        Expand-Archive -Path $sourcePackTypeSubfolderPath -Destination $destinationPackTypeFullPath -Force
    }
}