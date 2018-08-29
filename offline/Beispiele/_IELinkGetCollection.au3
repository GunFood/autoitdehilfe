#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet den Browser mit dem Grundbeispiel und erhält eine Verbindung zur Sammlung, durchläuft die einzelnen Einträge und zeigt die damit verbundenen URLs Referenzen

Local $oIE = _IE_Example("basic")
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended
Local $sTxt = $iNumLinks & " Links gefunden" & @CRLF & @CRLF
For $oLink In $oLinks
	$sTxt &= $oLink.href & @CRLF
Next
MsgBox($MB_SYSTEMMODAL, "Link Info", $sTxt)
