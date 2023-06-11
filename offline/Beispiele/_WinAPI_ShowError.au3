#include <WinAPI.au3>

_WinAPI_ShowError("Fehler 1", False)
_WinAPI_ShowError("Fehler 2", True)
_WinAPI_ShowError("Fehler 3", False) ;MsgBox erscheint nicht, da die vorherige das Skript beendet

While 1
	Sleep(10)
WEnd