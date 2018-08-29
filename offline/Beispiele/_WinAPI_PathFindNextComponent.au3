#include <WinAPIShPath.au3>

Local $sPath = @ScriptFullPath

While $sPath
	ConsoleWrite($sPath & @CRLF)
	$sPath = _WinAPI_PathFindNextComponent($sPath)
WEnd
$sPath = _WinAPI_PathFindNextComponent("")
ConsoleWrite('Pfad = "' & $sPath & '" -> @error = ' & @error & @CRLF)
