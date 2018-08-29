;Erstellt ein unsichtbares Browserfenster, navigiert zu einer
;               Webseite, fragt Informationen ab und schlieﬂt den Browser.


#Include <MsgBoxConstants.au3>
#include <IE.au3>

$oIE = _IECreate("http://dict.leo.org", 0, 0)
Local $oElement = "keywords"
; Zeigt den "content" des Elementes mit dem Namen "keywords" auf der Seite an.
Local $oInfo = _IEGetObjByName($oIE, $oElement)
MsgBox($MB_OK, "Objektinformation: " & $oElement, $oInfo.content)
_IEQuit($oIE)

