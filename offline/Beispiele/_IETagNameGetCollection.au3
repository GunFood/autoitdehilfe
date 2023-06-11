#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet einen Browser mit einem Formular Beispiel,
; Sammelt alle INPUT tags und zeigt sie den Form-Namen, sowie alle Typen dieser an

Local $oIE = _IE_Example("form")
Local $oInputs = _IETagNameGetCollection($oIE, "input")
Local $sTxt = ""
For $oInput In $oInputs
	$sTxt &= $oInput.type & @CRLF
Next
MsgBox($MB_SYSTEMMODAL, "Form Input Type", "Form: " & $oInput.form.name & @CRLF & @CRLF & "         Types :" & @CRLF & $sTxt)

_IEQuit($oIE)
