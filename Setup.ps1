# Source: http://www.hanselman.com/blog/SwitchEasilyBetweenVirtualBoxAndHyperVWithABCDEditBootEntryInWindows81.aspx
#C:\>bcdedit /copy {current} /d "No Hyper-V" 
#The entry was successfully copied to {ff-23-113-824e-5c5144ea}. 

#C:\>bcdedit /set {ff-23-113-824e-5c5144ea} hypervisorlaunchtype off 
#The operation completed successfully.



#This script assumes that it is run on a Windows machine. Because this file usualy resides in the root of a dropbox folder, it assumes dropbox is installed.
#It is meant to be run once ()

Set-Variable -Name programPath -Value "D:\Programme\"

#Ensure that scripts can be executed. May be executed manualy
Set-ExecutionPolicy Unrestricted

#Install choco
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))


###################Settings in Windows######################
#Activate and install updates
#Use Small Icons in taskbar

#Install

###################Things to install via Choco #############
$installedPackages = choco list --lo | ? { $_ -NotMatch "packages installed." }
$packages = Get-Content .\chocolateyPackages.ps1 | Select-String -pattern "#" -NotMatch | ? {$_.ToString().trim() -ne "" }
$packages | ForEach-Object {choco install $_ -y }
###################Things to install manually ##############

#driver
#Samsung Drucker Treiber
