#include <IE.au3>
#include <MsgBoxConstants.au3>

; Erstellt ein unsichtbares Browserfenster, navigiert zu einer Website, ruft einige Informationen auf und beendet den Internet-Explorer.

Local $oIE = _IECreate("http://sourceforge.net")
; Zeigt den inneren Text in einem Element der Seite namens "sfmarquee"
Local $oMarquee = _IEGetObjByName($oIE, "sfmarquee")
If IsObj($oMarquee) Then
	MsgBox($MB_SYSTEMMODAL, "SourceForge Information", $oMarquee.innerText)
Else
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "SourceForge Information", "Kein sfmarquee gefunden !!!")
EndIf
_IEQuit($oIE)
