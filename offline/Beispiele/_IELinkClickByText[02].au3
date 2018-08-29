#include <IE.au3>

; Öffnet Browser mit der AutoIt-Startseite, durchsucht alle Links
; auf der Seite und klickt auf den Link mit dem Text "wallpaper"
; durch einen Abgleich des Teilstrings.

Local $oIE = _IECreate("http://www.autoitscript.com")

Local $sMyString = "overview"
Local $oLinks = _IELinkGetCollection($oIE)
For $oLink In $oLinks
	Local $sLinkText = _IEPropertyGet($oLink, "innerText")
	If StringInStr($sLinkText, $sMyString) Then
		_IEAction($oLink, "click")
		ExitLoop
	EndIf
Next
