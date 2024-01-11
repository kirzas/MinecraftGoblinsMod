# MinecraftGoblinsMod
Minecraft mod with goblins

# Start working on the pack
With assuption you do that aon a Windows device. You need PowerShell 7 to use build scripts.

Create test world, default name for it is TestWorld.
You will need to rename world folder to TestWorld as well.

World folders are likely located at this path
```
# C:\Users\<username>\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\minecraftWorlds
# Find the folder that you created as a test world and rename it to TestWorld
```

Checkout the repository to your computer. Click on Code button to get the url.
```git clone <url>```

Create settings.json file in build_scripts folder. You can use Initialize-ZuZSetting function in the same fodler.
```
. .\build_scripts\Initialize-ZuZSetting.ps1
```

Now you can change the repository.
After you made some changes to the pack, you can launch these command to deploy your module to minecraft and to the TestWorld:
```
. '.\build_scripts\New-ZuzMcPack.ps1'
. '.\build_scripts\New-ZuzMcPack.ps1'

```