# showhtk
A simple OBS script to show pressed common hotkey form (e.g. Ctrl+C, Alt+V) in screen.

Demo: https://youtu.be/iMdDl_yG-c4

Instructions:
1. Download the showhtk.lua and save to any folder you like.
2. In OBS, create a new text source, and design it, because showhtk.lua doesn't design text source.
3. Go to *Tools* menu > *Scripts*. Click the plus button to add the script.
4. At the right side of the window are the Description and 2 Properties: *Duration (seconds)* and *Text Source*. Modify the duration as you wish and load the text source you just created.
5. Click *Close*, and try pressing some hotkeys now!

Supported hotkeys so far are found [here](../../issues/1).

Where I got this idea and code inspiration?
* Thanks to upgradeQ here: https://ideas.obsproject.com/posts/746/show-user-keystrokes-on-screen
* Their script: https://github.com/upgradeQ/OBS-VirtualChat
