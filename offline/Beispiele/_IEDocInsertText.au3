#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet eine Beispiel-Seite mit der Bezeichnung "basic" in einem Browser, fügt Text ein in und um den ersten "Paragraph tag" und zeigt den HTML Body-Text.

Local $oIE = _IE_Example("basic")
Local $oP = _IETagNameGetCollection($oIE, "p", 0)

_IEDocInsertText($oP, "(Text beforebegin)", "beforebegin")
_IEDocInsertText($oP, "(Text afterbegin)", "afterbegin")
_IEDocInsertText($oP, "(Text beforeend)", "beforeend")
_IEDocInsertText($oP, "(Text afterend)", "afterend")

MsgBox($MB_SYSTEMMODAL, "Body", _IEBodyReadHTML($oIE) & @CRLF)
