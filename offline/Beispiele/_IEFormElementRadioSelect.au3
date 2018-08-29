#include <IE.au3>

; Öffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; wählt jeden Radiobutton byValue-Wert aus, wählt dann, das letzte Item ab und lässt alles nicht ausgewählt zurück.

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
_IEAction($oForm, "focus")
For $i = 1 To 3
	_IEFormElementRadioSelect($oForm, "Flugzeug", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Zug", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Boot", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Auto", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Auto", "Radio-Beispiel", 0, "byValue")
	Sleep(1000)
Next

_IEQuit($oIE)
