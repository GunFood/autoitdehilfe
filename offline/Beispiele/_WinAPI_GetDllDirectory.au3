#include <WinAPIRes.au3>
#include <WinAPISys.au3>

If Not _WinAPI_SetDllDirectory(@ScriptDir & '\Extras') Then
	Exit
EndIf

Local $hModule = _WinAPI_LoadLibraryEx('Resources.dll', $LOAD_LIBRARY_AS_DATAFILE)

ConsoleWrite('Pfad:   ' & _WinAPI_GetDllDirectory() & @CRLF)
ConsoleWrite('Modul: ' & $hModule & @CRLF)

_WinAPI_FreeLibrary($hModule)
