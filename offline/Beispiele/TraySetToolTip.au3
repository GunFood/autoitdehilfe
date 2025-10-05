#NoTrayIcon

#include <TrayConstants.au3>

Example()

Func Example()
	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.
	TraySetToolTip("Ein Beispiel eines Traymenü Tooltips.") ; Das Traymenüicon muss sichtbar sein wenn dessen Text geändert werden soll.

	While 1
		Sleep(100) ; CPU-Last verhindern.
	WEnd
EndFunc   ;==>Example
