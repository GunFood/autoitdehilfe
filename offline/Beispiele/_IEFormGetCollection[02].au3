#include <IE.au3>
#include <MsgBoxConstants.au3>

; Stellt einen Verweis auf die Sammlung von Formen auf einer Seite her
; Und zeigt dann, in einer Schleife, alle Informationen für jede Form an

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oForms = _IEFormGetCollection($oIE)
MsgBox($MB_SYSTEMMODAL, "Formen Informationen", "Es befinden sich " & @extended & " Formen auf dieser Seite")
For $oForm In $oForms
	MsgBox($MB_SYSTEMMODAL, "Form Information", $oForm.name)
Next
