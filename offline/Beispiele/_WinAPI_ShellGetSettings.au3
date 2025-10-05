#include <WinAPIShellEx.au3>

_WinAPI_ShellSetSettings($SSF_SHOWEXTENSIONS, Not _WinAPI_ShellGetSettings($SSF_SHOWEXTENSIONS))

ConsoleWrite('Dateierweiterung für bekannte Dateitypen nicht anzeigen: ' & (Not _WinAPI_ShellGetSettings($SSF_SHOWEXTENSIONS)) & @CRLF)
