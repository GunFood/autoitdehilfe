#include <WinAPIFiles.au3>

Local $hFile = FileOpen(@ScriptFullPath)

ConsoleWrite(@ScriptName & ' in Verwendung: ' & _WinAPI_FileInUse(@ScriptFullPath) & @CRLF)
FileClose($hFile)
ConsoleWrite(@ScriptName & ' in Verwendung: ' & _WinAPI_FileInUse(@ScriptFullPath) & @CRLF)
