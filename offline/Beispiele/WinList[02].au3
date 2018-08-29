#include <Array.au3>

Example()

Func Example()
	; Ermittelt eine Liste mit Fensterhandles durch die Verwendung eines regulären Ausdrucks. Der reguläre Ausdruck prüft den Titel der die Wörtet 'SciTE' oder 'Internet Explorer' enthält.
	Local $aWinList = WinList("[REGEXPTITLE:(?i)(.*SciTE.*|.*Internet Explorer.*)]")
	_ArrayDisplay($aWinList)
EndFunc   ;==>Example
