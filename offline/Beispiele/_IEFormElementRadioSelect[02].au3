#include <IE.au3>

; Öffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; wählt jeden Radiobutton byIndex-Wert aus, wählt dann, das letzte Item ab und lässt alles nicht ausgewählt zurück.
; Es ist folgendes zu beachten: Es muss wahrscheinlich In der Seite runtergescrollt werden um die Veränderungen zu sehen

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 3
	_IEFormElementRadioSelect($oForm, 3, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 2, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 1, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 0, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 0, "Radio-Beispiel", 0, "byIndex")
	Sleep(1000)
Next

_IEQuit($oIE)
