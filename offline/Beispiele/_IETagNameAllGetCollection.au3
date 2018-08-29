#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet einen Browser mit dem Grundlagen Beispiel.
; Sammelt alle Elemente und zeigt den Tag-Namen sowie den Text innerhalb an

Local $oIE = _IE_Example("basic")
Local $oElements = _IETagNameAllGetCollection($oIE)
For $oElement In $oElements
	If $oElement.id Then MsgBox($MB_SYSTEMMODAL, "Element Info", "Tagname: " & $oElement.tagname & @CRLF & "id: " & $oElement.id & @CRLF & "innerText: " & $oElement.innerText)
Next
_IEQuit($oIE)
