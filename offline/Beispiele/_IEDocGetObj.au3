#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet den Browser mit der AutoIt Homepage, holt sich die Referenz auf das Dokumentobjekt und zeigt ein Dokumentattribut an

Local $oIE = _IECreate("http://www.google.com")
Local $oDoc = _IEDocGetObj($oIE)
MsgBox($MB_SYSTEMMODAL, "Document Created Date", $oDoc.fileCreatedDate)
