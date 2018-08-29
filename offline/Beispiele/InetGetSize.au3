#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt die Größe der Datei. Diese Option "Datei aus dem lokalen Cache holen" wurde ausgewählt.
	Local $iSize = InetGetSize("http://www.autoitscript.com/autoit3/files/beta/update.dat")
	MsgBox($MB_SYSTEMMODAL, "", "Die Größe der Datei lautet: " & $iSize)
EndFunc   ;==>Example
