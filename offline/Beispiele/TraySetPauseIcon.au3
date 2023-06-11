#include <TrayConstants.au3> ; wird für die $TRAY_ICONSTATE_SHOW Konstante benötigt.

#NoTrayIcon

Example()

Func Example()
	TraySetPauseIcon("shell32.dll", 12) ; Setzt das Pause-Icon. Dieses fängt an zu blinken wenn das Traymenü ausgewählt und das Skript pausiert wurde.
	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	While 1
		Sleep(100) ; CPU-Last verhindern.
	WEnd
EndFunc   ;==>Example
