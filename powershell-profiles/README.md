# powershell profile

This folder contains the Powershell profile I use. To use it, copy it (or its contents) to whatever your current profile is, which can be found by typing `$PROFILE` in Powershell. You'll need Powerline for it, which can be set up by following the guide below.

You also need your execution policy set to "RemoteSigned" or "Unrestricted" for Powershell to load a profile, like this:

```powershell
Set-ExecutionPolicy Unrestricted
# or
Set-ExecutionPolicy RemoteSigned
```
<sub>This can be done system-wide by running either of the above in a Powershell window as Administrator, or only for the current user by adding `-Scope CurrentUser` to the end of the command.</sub>

<sup><sup>friendly reminder: don't run random scripts from the internet you don't understand or trust</sup></sup>

## Set up Powerline

The profile in here utilizes Powerline, which can be setup by doing installing the "Posh-Git" and "Oh-My-Posh" Powershell modules.
for which a setup guide can be found [here](https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup). That page also explains how to set up Powerline for Linux (specifically WSL Ubuntu). The guide basically boils down to installing "Posh-Git" and "Oh-My-Posh" using Powershell:

The steps linked above say to use `-Scope CurrentUser`, but I do `AllUsers` (while running Powershell as admin) because I like to have this work when running Powershell as admin too. Probably don't do this on a multi-user system.

```powershell
Install-Module posh-git -Scope AllUsers
Install-Module oh-my-posh -Scope AllUsers
```

## Install and select a font to use:

Powerline uses fancy special characters, so you need a fancy special font that supports them. A bunch of those can be found [here](https://www.nerdfonts.com/font-downloads) (there are probably plenty more elsewhere on the internet too). Personally, I like the font "Hack".

### Windows Terminal
To select the font in Windows Terminal, go to Settings (`Ctrl`+`,`), select your Powershell profile, go to the "Appearance" tab, and type the font name ("Hack NF" in my case) into the "Font Face" box.

<sub>The actual system font name might not be intuitive; to find the list of installed fonts and the names Windows knows them by on your system, go to Control Panel → Appearance and Personalization → Fonts. The name listed there should be typed into the box.</sub>

### Powershell
To select the font for Powershell (outside of Windows Terminal), open Powershell (duh), right click on the title bar thing (with the window controls and stuff), open "Properties", go to the "Font" tab, and select your font in the list. You can change the font for Command Prompt this way too, though you can't use Powerline in Command Prompt.

### VSCode integrated terminal
To use the Powerline font in the VSCode integrated terminal, set the user preference `terminal.integrated.fontFamily` to the font you chose.

### WSL tip: Share fonts from Windows

If you set up Powerline for WSL (guide is linked under "Set up Powerline"), you may want to have it access fonts you installed in Windows. You can set that up by following [this guide](https://x410.dev/cookbook/wsl/sharing-windows-fonts-with-wsl/). The important steps are summarized below, but go to the link if you want more information.

1. Find your Windows font folder — usually `C:\Windows\Fonts` but maybe not for you.
2. Add the folder path to `/etc/fonts/local.conf` in WSL. You will need root privileges to create/edit this file. Add the following lines to the file, adjusting the \<dir> tag accordingly. Your outside drives are found under `/mnt` in WSL, so the path in step 1 is replaced with `/mnt/c/Windows/Fonts`:
```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/mnt/c/Windows/Fonts</dir>
</fontconfig>
```