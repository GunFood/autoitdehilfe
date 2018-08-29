#include <IE.au3>
#include <MsgBoxConstants.au3>

; Stellt einen Verweis auf die Sammlung von Formen auf einer Seite her
; Und zeigt dann, in einer Schleife, alle Informationen für jede Anzeige-Nutzung vom Form-Index an


Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oForms = _IEFormGetCollection($oIE)
Local $iNumForms = @extended
MsgBox($MB_SYSTEMMODAL, "Formen Informationen", "Es befinden sich " & $iNumForms & " Formen auf dieser Seite")
Local $oForm
For $i = 0 To $iNumForms - 1
	$oForm = _IEFormGetCollection($oIE, $i)
	MsgBox($MB_SYSTEMMODAL, "Form Information", $oForm.name)
Next
