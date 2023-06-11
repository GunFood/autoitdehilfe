#include <WinAPI.au3>

ShellExecute("notepad", "", "", "", @SW_MAXIMIZE)
$handle = WinWait("[CLASS:Notepad]")
Sleep(500)
_WinAPI_MoveWindow($handle, 10, 10, 400, 400)
Sleep(500)
_WinAPI_MoveWindow($handle, 100, 100, 200, 200)