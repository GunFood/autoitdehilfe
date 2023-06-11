#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 	3.2.8.1
	Autor:         		David Nuttall
	
	Skriptfunktion:		Dieses Grundlagenskript zeigt die Funktionalität der Debug-Funktionen
	
#ce ----------------------------------------------------------------------------

#include <Debug.au3>

_DebugSetup("Teste Excel") ; Beginnt mit dme anzeigen der Debug-Umgebung
For $i = 1 To 4
	WinActivate("Microsoft Excel")
	; Mit Excel arbeiten
	Send("{Down}")
	_DebugOut("Maus wurde nach unten bewegt.") ; Schreibt die Ausgabe in ein Editor-Fenster
Next
