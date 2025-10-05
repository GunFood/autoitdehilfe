#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("Meine GUI", 170, 40)

	Local $idBtn_Options = GUICtrlCreateButton("&Optionen", 10, 10, 70, 20, $BS_FLAT)

	; Zuerst ein Dummy-Control für die Optionen und ein Kontextmenü erzeugen
	Local $idDmy_Options = GUICtrlCreateDummy()
	Local $idCtx_Options = GUICtrlCreateContextMenu($idDmy_Options)
	GUICtrlCreateMenuItem("Allgemein", $idCtx_Options)
	GUICtrlCreateMenuItem("Datei", $idCtx_Options)
	GUICtrlCreateMenuItem("", $idCtx_Options)
	Local $idMni_OptionsExit = GUICtrlCreateMenuItem("Beenden", $idCtx_Options)

	Local $idBtn_Help = GUICtrlCreateButton("&Hilfe", 90, 10, 70, 20, $BS_FLAT)

	; Dann ebenso ein Dummy-Control und ein Kontextmenü für die Hilfe erzeugen
	Local $idDmy_Help = GUICtrlCreateDummy()
	Local $idCtx_Help = GUICtrlCreateContextMenu($idDmy_Help)
	GUICtrlCreateMenuItem("Webseite", $idCtx_Help)
	GUICtrlCreateMenuItem("", $idCtx_Help)
	Local $idMni_HelpAbout = GUICtrlCreateMenuItem("Über...", $idCtx_Help)

	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()

		Switch $idMsg
			Case $idMni_OptionsExit, $GUI_EVENT_CLOSE
				ExitLoop

			Case $idBtn_Options
				ShowMenu($hGui, $idMsg, $idCtx_Options)

			Case $idBtn_Help
				ShowMenu($hGui, $idMsg, $idCtx_Help)

			Case $idMni_HelpAbout
				MsgBox($MB_SYSTEMMODAL, "Über...", "GUICtrlGetHandle-Beispiel")
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example

; Zeigt ein Menü zugehörig einem bestimmten GUI-Control in einem bestimmten GUI-Fenster
Func ShowMenu($hWnd, $CtrlID, $nContextID)
	Local $aPos, $x, $y
	Local $hMenu = GUICtrlGetHandle($nContextID)

	$aPos = ControlGetPos($hWnd, "", $CtrlID)

	$x = $aPos[0]
	$y = $aPos[1] + $aPos[3]

	ClientToScreen($hWnd, $x, $y)
	TrackPopupMenu($hWnd, $hMenu, $x, $y)
EndFunc   ;==>ShowMenu

; Passt die Clientkoordinaten (GUI) den Bildschirmkoordinaten (Desktop) an
Func ClientToScreen($hWnd, ByRef $x, ByRef $y)
	Local $tPoint = DllStructCreate("int;int")

	DllStructSetData($tPoint, 1, $x)
	DllStructSetData($tPoint, 2, $y)

	DllCall("user32.dll", "int", "ClientToScreen", "hwnd", $hWnd, "ptr", DllStructGetPtr($tPoint))

	$x = DllStructGetData($tPoint, 1)
	$y = DllStructGetData($tPoint, 2)
	; Freigabe der Struktur nicht unbedingt nötig, solange sie lokal ist
	$tPoint = 0
EndFunc   ;==>ClientToScreen

; Zeigt an den angegebenen Koordinaten (x, y) das Popupmenü (hMenu) zugehörig einem bestimmten GUI-Fenster (hWnd)
Func TrackPopupMenu($hWnd, $hMenu, $x, $y)
	DllCall("user32.dll", "int", "TrackPopupMenuEx", "hwnd", $hMenu, "int", 0, "int", $x, "int", $y, "hwnd", $hWnd, "ptr", 0)
EndFunc   ;==>TrackPopupMenu
