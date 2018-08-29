#NoTrayIcon
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Zeigt ein Nachrichtenfenster mit dem Hinweis, dass das Trayicon erschint wenn OK angeklickt wurde.
	MsgBox($MB_SYSTEMMODAL, "", "Das Tray-Icon erscheint sobal OK angeklickt wurde.")

	; Zeigt das Trayicon.
	Opt("TrayIconHide", 0)

	; Wartet 5 Sekunden bevor das Skript beendet wurde.
	Sleep(5000)
EndFunc   ;==>Example
