Class Setting {
    [ValidateNotNullOrEmpty()]
    [string]$RepositoryPath

    [ValidateNotNullOrEmpty()]
    [string]$MinecraftPath = (Join-Path -Path $env:USERPROFILE -ChildPath 'AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang')

    [ValidateNotNullOrEmpty()]
    [string]$TestWorldName = 'TestWorld'

    [ValidateNotNullOrEmpty()]
    [string]$PackName = 'GoblinsMod'
}