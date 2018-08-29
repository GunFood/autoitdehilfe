#include <IE.au3>

; Öffnet den Browser mit der AutoIt Homepage
; Fügt ein Event-Script in den Header des Dokuments ein, welches verhindert, dass
; ein angeklickter Link geladen wird und schreibt die URL des angeklickten Links in die Konsole

Opt("TrayIconDebug", 1)

Local $oIE = _IECreate("http://www.autoitscript.com")

Local $oLinks = _IELinkGetCollection($oIE)
For $oLink In $oLinks
	Local $sLinkId = _IEPropertyGet($oLink, "uniqueid")
	If @error Then Exit
	_IEHeadInsertEventScript($oIE, $sLinkId, "onclick", "return false;")
	If @error Then Exit
	ObjEvent($oLink, "_Evt_")
Next

; wartet so lange bis das Browser-Fenster existiert
While WinExists(_IEPropertyGet($oIE, "hwnd"))
	Sleep(100)
WEnd

Func _Evt_onClick()
	Local $o_Link = @COM_EventObj
	ConsoleWrite($o_Link.href & @CRLF)
EndFunc   ;==>_Evt_onClick
