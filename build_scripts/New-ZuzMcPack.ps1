$rootPath = 'C:\Users\Argel\Dev\MinecraftGoblinsMod'

$packName = 'GoblinsMod'

$destinationFolderName = 'build'

$packTypes = @(
    'resource'
    'behavior'
)

$destinationFolderPath = Join-Path -Path $rootPath -ChildPath $destinationFolderName
if (-not (Test-Path -Path $destinationFolderPath)) {
    $null = New-Item -Path $destinationFolderPath -ItemType Directory
}

foreach ($type in $packTypes) {
    $sourceSubfolderPath = Join-Path -Path $rootPath -ChildPath "${type}_packs"
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

