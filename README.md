# showhtk
A simple OBS script to show pressed common hotkey form (e.g. Ctrl+C, Alt+V) in screen.

Demo: https://youtu.be/iMdDl_yG-c4

### Instructions
1. Download the showhtk.lua and save to any folder you like.
2. In OBS, create a new text source, and design it, because showhtk.lua doesn't design text source.
3. Go to *Tools* menu > *Scripts*. Click the plus button to add the script.
4. At the right side of the window are the Description and 2 Properties: *Duration (seconds)* and *Text Source*. Modify the duration as you wish and load the text source you just created.
5. Click *Close*, and try pressing some hotkeys now!

### Supported hotkeys so far

Here are the *base* keys:
```
Escape, F1-F12, Delete, Return, 0-9, A-Z, Tilde, Minus, Equals, Backspace, Tab, Left Bracket, Right Bracket, Backslash, Semicolon, Apostrophe, Comma, Period, Slash, Space
```

Supported hotkey forms:
* Escape, F1-F12, Delete, Return (Return is shown as *Enter* in Windows.)
* Shift+Escape, Shift+F1-F12, Shift+Delete, Shift+Return
* Ctrl+&lt;base key&gt;
* Ctrl+Shift+&lt;base key&gt;
* Ctrl+Alt+&lt;base key&gt;
* Ctrl+Alt+Shift+&lt;base key&gt;
* Alt+&lt;base key&gt;
* Alt+Shift+&lt;base key&gt;
* Cmd+&lt;base key&gt; (Cmd is *Win* key in Windows.)
* Cmd+Shift+&lt;base key&gt;

Just make an issue if anyone wants more hotkeys 😃. Note that I will not implement "incomplete" hotkeys like Ctrl *only*, Alt *only*, etc. because I found out that those keys alone, in some sense, "compete in being shown" with themselves and the hotkey forms above.

### Where I got this idea and code inspiration?
* Thanks to upgradeQ here: https://ideas.obsproject.com/posts/746/show-user-keystrokes-on-screen
* Their script: https://github.com/upgradeQ/OBS-VirtualChat
