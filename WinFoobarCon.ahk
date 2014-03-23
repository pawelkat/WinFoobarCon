;This script uses foo_httpcontrol server to control Foobar
;It uses keyboard MediaKeys (PlayPause, Media-next, Media-prev,Volume-up, Volume-down) to send requests. 
;One can map any keyboard shortcut; follow AutoHotkey manual
;Info about currently playing track will be displayed as OSD, as soon as response from server is arrived

#include httprequest.ahk
#include JSON.ahk

CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s20  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cRed  ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 160

DisplayInfo(responce, time) {
	j := JSON.parse("[" . responce . "]")
	strMsg := j[1].helper2
	GuiControl,, MyText, %strMsg%
	GuiControl, Move, MyText, W1920
	Gui, Show, AutoSize x1 yCenter NoActivate  ; NoActivate avoids deactivating the currently active window.
	SetTimer, RemoveWindow, % time
	return strB	
}
RemoveWindow:
	Gui, Hide

URL := "http://192.168.43.73:8888/ajquery/?cmd="

; add param3=js/state.json if you want server response, param3=NoResponse is no response needed

Media_Play_Pause::
HTTPRequest(URL . "PlayOrPause&param3=js/state.json", InOutData := "",, "Charset=utf-8")
DisplayInfo(InOutData, 2000)
return

Media_Next::
HTTPRequest(URL . "StartNext&param3=NoResponse")
Sleep, 500
HTTPRequest(URL . "&param3=js/state.json", InOutData := "",, "Charset=utf-8")
DisplayInfo(InOutData, 3000)
return

Media_Prev::
HTTPRequest(URL . "StartPrevious&param3=NoResponse")
Sleep, 500
HTTPRequest(URL . "&param3=js/state.json", InOutData := "",, "Charset=utf-8")
DisplayInfo(InOutData, 3000)
return

Volume_Down::
cmdStr:="VolumeDelta&param1=-5&param3=NoResponse"
HTTPRequest(URL . cmdStr)
return

Volume_Up::
cmdStr:="VolumeDelta&param1=5&param3=NoResponse"
HTTPRequest(URL . cmdStr)
return

