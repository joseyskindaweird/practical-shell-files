# Cool shell scripts for automation!


I've written some shell scripts that will automate some commands for basic Arch Linux tasks.
If you don't know what to do, follow the steps below and I'll walk ya through it, okay?

## Step 1: Obtaining Files
First step, grabbing the files. You need the package `git` for this.
Should be installed by default, but here's how to install it:

#### Install
``````
sudo pacman -S git
``````

Now you should have `git` installed.
Now run the commands below one by one.
``````
git clone https://github.com/strangetheproot/practical-shell-files.git
``````
Now you should have a folder named "practical shell files".

Type this command to go into it:
``````
 cd practical-shell-files
``````

Check with `ls` to see if you have all the files.

## Step 2: Prepare the shell files to execute
Cool, now you have the files. Time to prepare them with `chmod`.

Run the commands below one by one.
``````
 sudo chmod +x OptionalStuff.sh && sudo chmod +x Updater.sh && sudo chmod +x SimplePackageManager.sh
``````
No output on this command. Check if the files are labeled green by running `ls`, this will indicate that the files are ready to be executed.

## Final Step: Choosing which script to run.
Now you've reached the fork in the road, now you have to choose which script to run that fits your needs.

Pick a script to run:

`SimplePackageManager.sh` Run this script to install some essential and well known packages like [Thorium](https://github.com/Alex313031/thorium), Discord, Spotify, [Mercury](https://github.com/Alex313031/Mercury), Steam, etc. The documentation will be linked [here](https://github.com/strangetheproot/practical-shell-files/blob/main/guides/SimplePackageManagerHelp.md).

`Updater.sh` Run this script in order to update your system automatically. You must have `yay` installed to update the AUR, we'll cover the documentation in [this](https://github.com/strangetheproot/practical-shell-files/blob/main/guides/UpdaterScriptHelp.md) documentation. 

`OptionalStuff.sh` Run this script to install some small packages, like games and terminal eye candy! [Here's](https://github.com/strangetheproot/practical-shell-files/blob/main/guides/OptionalStuffHelp.md) the documentation for it.



## Contact me!
If you're still having issues, or have suggestions, feel free to contact me!

Discord: strange_being

Twitter/X: [@strangetheproot](https://twitter.com/strangetheproot)

eMail: smg72411@gmail.com


<img src=https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/assets/dance.gif>
