# Cool shell scripts for automation!


I've written some shell scripts that will automate some commands for basic Arch [Linux](https://github.com/torvalds/linux/) and some Debian tasks.
If you don't know what to do, follow the steps below and I'll walk ya through it, okay?

## Step 1: Obtaining Files
First step, grabbing the files. You need the package [`git`](https://git-scm.com/) for this.
Should be installed by default, but here's how to install it:

#### Debian (or ChromeOS)
``````
sudo apt install git
``````

#### Arch
``````
sudo pacman -S git
``````

Now you should have git installed.
Now run the commands below one by one.

``````
git clone https://github.com/strangetheproot/practical-shell-files.git
``````

Now you should have a folder named "practical shell files".
cd into it.
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
No output on this command. Check if the files are labeled green by running `ls`, this will indicate that the files are ready to be ran.

## Final Step: Choosing which script to run.
Now you've reached the fork in the road, now you have to choose which scripts to run that fit your needs.

Pick a script to run:

`SimplePackageManager.sh` Run this script to install some essential packages (Firefox, [Thorium](https://github.com/Alex313031/thorium), Discord, Spotify, etc.) This one is the most complex so it will have the most code and the longest README. The guide will be linked [here](https://github.com/strangetheproot/practical-shell-files/guides/SimplePackageManagerHelp.md).

`Updater.sh` Run this script in order to update your system automatically. You must have `yay` installed, we'll cover how to use this script in [this](https://github.com/strangetheproot/practical-shell-files/guides/UpdaterScriptHelp.md) documentation. 

`OptionalStuff.sh` Run this script to install some small fun programs like games. [Here's](https://github.com/strangetheproot/practical-shell-files/guides/OptionalStuffHelp.md) the guide for it.



## Contact me!
If you're still having issues, or have suggestions, feel free to contact me!

Discord: strange_being

Twitter/X: [@strangetheproot](https://twitter.com/strangetheproot)

eMail: smg72411@gmail.com


<img src=https://raw.githubusercontent.com/strangetheproot/practical-shell-files/main/assets/dance.gif>