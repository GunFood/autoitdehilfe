#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3> ; wird für die $TRAY_ICONSTATE_SHOW Konstante benötigt.

#NoTrayIcon

Opt("TrayMenuMode", 3) ; Die Standard Traymenüeinträge (Skript pausieren/beenden) werden nicht angezeigt und die Items werden nicht angehakt wenn diese ausgewählt werden. Verwendet wurden die Optionen 1 und 2 für TrayMenuMode.

Global Const $MIM_APPLYTOSUBMENUS = 0x80000000, $MIM_BACKGROUND = 0x00000002 ; Die Konstanten werden für SetMenuColor benötigt

Example()

Func Example()
	Local $idSettings = TrayCreateMenu("Einstellungen") ; Erstellt ein Traymenü mit zwei Untermenüs.
	Local $idDisplay = TrayCreateItem("Anzeige", $idSettings)
	Local $idPrinter = TrayCreateItem("Drucker", $idSettings)
	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	Local $idAbout = TrayCreateItem("Über")
	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	Local $idExit = TrayCreateItem("Exit")

	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	SetMenuColor(0, 0xEEBB99) ; BGR Farbwert, '0' bezieht sich auf das Traymenü selbst.
	SetMenuColor($idSettings, 0x66BB99); BGR Farbwert für das 'Einstellungen' Menü.

	While 1
		Switch TrayGetMsg()
			Case $idAbout ; Zeigt ein Nachrichtenfenster mit der AutoIt Version und dem Installationspfad der AutoIt Startdatei.
				MsgBox($MB_SYSTEMMODAL, "", "AutoIt Traymenü Beispiel." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Installationspfad: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1) - 1)) ; Ermittelt den Ordner eines kompletten Pfads.

			Case $idDisplay, $idPrinter
				MsgBox($MB_SYSTEMMODAL, "", "Ein Untermneü wurde im Traymneü ausgewählt.")

			Case $idExit ; Beendet die Schleife.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func SetMenuColor($iMenuID, $iColor)
	Local $hMenu = TrayItemGetHandle($iMenuID) ; Ermittelt das interne Menühandle

	Local $hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $iColor)
	$hBrush = $hBrush[0]

	Local $tMenuInfo = DllStructCreate("dword;dword;dword;uint;ptr;dword;ptr")
	DllStructSetData($tMenuInfo, 1, DllStructGetSize($tMenuInfo))
	DllStructSetData($tMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($tMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "struct*", $tMenuInfo)
EndFunc   ;==>SetMenuColor
