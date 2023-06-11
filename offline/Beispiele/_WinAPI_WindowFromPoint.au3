#include <WinAPISysWin.au3>

HotKeySet("{ESC}", "Close") ; Setzt ESC als Hotkey um das Skript zu beenden

Global $g_tStruct = DllStructCreate($tagPOINT) ; Erstellt eine Struktur, welche den zu prüfenden Punkt definiert
Example()

Func Example()
	Local $hWnd

	While 1
		ToolTip("")
		Position() ; Aktualisiert die X und Y Elemente mit den X und Y Co-Koordinaten der Maus
		$hWnd = _WinAPI_WindowFromPoint($g_tStruct) ; Ermittelt das Handle des Fensters
		ToolTip($hWnd) ; Setzt den Tooltip mit dem Handle unter dem Mauszeiger.
		Sleep(100)
	WEnd
EndFunc   ;==>Example

Func Position()
	DllStructSetData($g_tStruct, "x", MouseGetPos(0))
	DllStructSetData($g_tStruct, "y", MouseGetPos(1))
EndFunc   ;==>Position

Func Close()
	Exit
EndFunc   ;==>Close
