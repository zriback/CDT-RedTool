# CDT-RedTool

This was a red team tool created for the Cyber Defense Techniques class at RIT.

## The Tool

This is a very simple tool designed to distract blue teamers and create easy access points for red team. It is targetted towards Windows. Blue teamers will find that whenever they try and remove or disable a local user (often the first step of a five minute plan) that a new user, called "red" is created. Disabling or removing this user will not work.

## How It Works

This tool creates aliases for the following commands.
* Disable-LocalUser
* Remove-LocalUser
* dlu
* rlu

These aliases point to the scripts Disable-LocalUser-Hook.ps1 and Remove-LocalUser-Hook.ps1 which are placed into the C:\Windows\System32 directory on Windows. The function of these scripts is to perform the intended action of the user, but also create a "red" user with a password known to the red team. Blue teamers will get distracted by this strange behavior, and red teamers will have yet another method of access into the box through this user.

## How to Deploy

To deploy this tool, put the IP addresses of all the Window's boxes you want to deploy to in the inventory.ini file. Deploy using the following command:

```ansible-playbook -i inventory.ini deploy-red.yml```

All the specified hosts should now have the tool installed.
