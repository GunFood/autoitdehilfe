#Include <Misc.au3>

Global $datei_1 = "3.3.10.2"
Global $datei_2 = "3.3.14.2"
Global $vergleich = _VersionCompare($datei_1, $datei_2)

If $vergleich = 1 Then
	MsgBox(64, "Vergleich", "Datei 1 hat die neuere Versionsnummer")
ElseIf $vergleich = -1 Then
	MsgBox(64, "Vergleich", "Datei 2 hat die neuere Versionsnummer")
Else
	MsgBox(64, "Vergleich", "Beide Dateien haben die gleiche Versionsnummer")
EndIf