#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet einen Browser mit dem basic-Beispiel, ließt den body Text (der Inhalt mit allen HTML-Tags entfernt) und zeigt ihn in einer MsgBox.

Local $oIE = _IE_Example("basic")
Local $sText = _IEBodyReadText($oIE)
MsgBox($MB_SYSTEMMODAL, "Body Text", $sText)
_IEQuit($oIE)
