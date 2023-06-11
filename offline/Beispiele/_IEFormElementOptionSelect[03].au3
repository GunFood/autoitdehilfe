#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her, stellt die Verbindung zum gewählten Element her, prüft ob die Option "Freepage" ausgewählt ist und gibt das Ergebnis zurück.
; Wiederholung mit der Option von Index 0 und mit der Option vom Wert 'midipage.html'
; Folgendes ist zu beachten: Möglicherweise muss man bis ans Ende der Seite scrollen um die Änderung zu sehen.

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
If _IEFormElementOptionSelect($oSelect, "Freepage", -1, "byText") Then
	MsgBox($MB_SYSTEMMODAL, "Option ausgewählt", "Option Freepage ist ausgewählt")
Else
	MsgBox($MB_SYSTEMMODAL, "Option ausgewählt", "Option Freepage ist nicht ausgewählt")
EndIf
If _IEFormElementOptionSelect($oSelect, 0, -1, "byIndex") Then
	MsgBox($MB_SYSTEMMODAL, "Option ausgewählt", "Die erste Option (index 0) ist ausgewählt")
Else
	MsgBox($MB_SYSTEMMODAL, "Option ausgewählt", "Die Erste Option (index 0) ist nicht ausgewählt")
EndIf
If _IEFormElementOptionSelect($oSelect, "midipage.html", -1, "byValue") Then
	MsgBox($MB_SYSTEMMODAL, "Option ausgewählt", "Die Option mit dem Wert 'midipage.html' ist ausgewählt")
Else
	MsgBox($MB_SYSTEMMODAL, "Option ausgewählt", "Die Option mit dem Wert 'midipage.html' ist nicht ausgewählt")
EndIf

_IEQuit($oIE)
