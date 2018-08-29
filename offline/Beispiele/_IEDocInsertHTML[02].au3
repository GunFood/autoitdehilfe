#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet einen Browser mit einer grundlegenden Beispielseite, fügt HTML in
; Und um den DIV-Tag "IEAu3Data" ein und zeigt den BODY-Quellcode.

Local $oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjById($oIE, "IEAu3Data")

_IEDocInsertHTML($oDiv, "<b>(HTML beforebegin)</b>", "beforebegin")
_IEDocInsertHTML($oDiv, "<i>(HTML afterbegin)</i>", "afterbegin")
_IEDocInsertHTML($oDiv, "<b>(HTML beforeend)</b>", "beforeend")
_IEDocInsertHTML($oDiv, "<i>(HTML afterend)</i>", "afterend")

MsgBox($MB_SYSTEMMODAL, "Body", _IEBodyReadHTML($oIE) & @CRLF)
