#include <IE.au3>
#include <MsgBoxConstants.au3>

;Öffnet einen Browser mit dem basic-Beispiel, eine Objektreferenz zum DIV-Element mit der ID "line1" erstellen. Gibt den innerText dieses Elements in einem Nachrichtenfenster aus.

Local $oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjById($oIE, "line1")
MsgBox($MB_SYSTEMMODAL, "Zeile1", $oDiv.innertext)
