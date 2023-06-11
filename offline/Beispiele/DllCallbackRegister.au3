#include <MsgBoxConstants.au3>

; Erstellt Callback Funktion
Local $hHandle = DllCallbackRegister("_EnumWindowsProc", "int", "hwnd;lparam")

; EnumWindows aufrufen
DllCall("user32.dll", "int", "EnumWindows", "ptr", DllCallbackGetPtr($hHandle), "lparam", 10)

; Löscht Callback-Funktion
DllCallbackFree($hHandle)

; Callback Verfahren
Func _EnumWindowsProc($hWnd, $lParam)
	; Falls der Titel leer ist oder das Fenster nicht sichtbar ist, so wird die Aufzählung fortgesetzt.
	If WinGetTitle($hWnd) = "" Or BitAND(WinGetState($hWnd), 2) = 0 Then Return 1

	Local $iRes = MsgBox(($MB_OKCANCEL + $MB_SYSTEMMODAL), _
			WinGetTitle($hWnd), "$hWnd=" & $hWnd & @CRLF & _
			"$lParam=" & $lParam & @CRLF & _
			"$hWnd(type)=" & VarGetType($hWnd))

	If $iRes <> $IDOK Then Return 0 ; Wenn Abbrechen geklickt, Rückgabe 0 zum Stoppen der Aufzählung

	Return 1 ; Rückgabe 1 um die Aufzählung fortzusetzten
EndFunc   ;==>_EnumWindowsProc
