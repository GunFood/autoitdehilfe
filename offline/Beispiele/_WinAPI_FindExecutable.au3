#include <MsgBoxConstants.au3>
#include <WinAPIShellEx.au3>

; Mit diesem Skript wird das verknüpfte Programm ermittelt
MsgBox($MB_SYSTEMMODAL, "_WinAPI_FindExecutable", "Datei: " & @ScriptName & @CRLF & "Verknüpftes Programm: " & _WinAPI_FindExecutable(@ScriptName))
