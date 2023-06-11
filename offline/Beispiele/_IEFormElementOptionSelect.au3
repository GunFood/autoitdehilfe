#include <IE.au3>

; Öffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her, stellt die Verbindung zum gewählten Element her, geht in einer 10er Schleife die Auswahl Optionen byValue-Wert, byText-Wert und byIndex-Wert durch
; Es ist folgendes zu beachten: Möglicherweise muss man bis ans Ende der Seite scrollen, um die Änderung zu sehen.

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
_IEAction($oSelect, "focus")
For $i = 1 To 10
	_IEFormElementOptionSelect($oSelect, "Freepage", 1, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "midipage.html", 1, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 0, 1, "byIndex")
	Sleep(1000)
Next

_IEQuit($oIE)
