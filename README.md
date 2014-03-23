WinFoobarCon
============

AutoHotkey script to control Foobar via http.

The script allows to control your remote Foobar2000 audio player with your PC's (Windows) keyboard shortcuts. It uses foo_httpcontrol plugin similarly as Android FoobarCon app (https://play.google.com/store/apps/details?id=com.wan.FooController) does.

Features:
---------
* sends a commands like PlayPause, Media-next, Media-prev, Volume-up, Volume-down to your remote foobar instance
* displays shortly track info about current audio track as the json response arrives (something like OSD)

Dependecies:
------------
JSON.ahk (https://github.com/cocobelgica/AutoHotkey-JSON/blob/master/JSON.ahk)
HTTPRequest.ahk (http://pastebin.com/5qVVuDxA)

How to make your remote control running:
----------------------------------------
1. install foo_httpcontrol plugin for remote foobar: http://code.google.com/p/foo-httpcontrol/
2. install ajquery template following foo_httpcontrol instructions
3. install AutoHotkey
4. configure IP addres and port entry in WinFoobarCon (URL variable)
5. configure your keyboard shortcuts (AHK manual http://www.autohotkey.com/docs/KeyList.htm). By default they actions are mapped to multimedia keys (PlayPause, Media-next, Media-prev,Volume-up, Volume-down)
5. run WinFoobarCon.ahk (don't forget to correctly include dependencies). You can add it to Startup.
