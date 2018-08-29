#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>

Opt('MustDeclareVars', 1)


Example2()


; ********************
; * Zweites Beispiel *
; ********************
Func Example2()
	Local $hGui, $OptionsBtn, $OptionsDummy, $OptionsContext, $OptionsCommon, $OptionsFile, $msg
	Local $OptionsExit, $HelpBtn, $HelpDummy, $HelpContext, $HelpWWW, $HelpAbout
	$hGui = GUICreate("Meine GUI", 170, 120)

	$OptionsBtn = GUICtrlCreateButton("&Optionen", 10, 10, 70, 20, $BS_FLAT)

	; Zuerst ein Dummy-Control f&uuml;r die Optionen und ein Kontextmen&uuml; erzeugen
	$OptionsDummy = GUICtrlCreateDummy()
	$OptionsContext = GUICtrlCreateContextMenu($OptionsDummy)
	$OptionsCommon = GUICtrlCreateMenuItem("Allgemein", $OptionsContext)
	$OptionsFile = GUICtrlCreateMenuItem("Datei", $OptionsContext)
	GUICtrlCreateMenuItem("", $OptionsContext)
	$OptionsExit = GUICtrlCreateMenuItem("Beenden", $OptionsContext)

	; Dann ebenso ein Dummy-Control und ein Kontextmen&uuml; f&uuml;r die Hilfe erzeugen
	$HelpDummy = GUICtrlCreateDummy()
	$HelpContext = GUICtrlCreateContextMenu($HelpDummy)
	$HelpWWW = GUICtrlCreateMenuItem("Webseite", $HelpContext)
	GUICtrlCreateMenuItem("", $HelpContext)
	$HelpAbout = GUICtrlCreateMenuItem("&Uuml;ber...", $HelpContext)


	GUISetState()

	While 1
		$msg = GUIGetMsg()

		Switch $msg
			Case $OptionsExit, $GUI_EVENT_CLOSE
				ExitLoop

			Case $OptionsBtn
				ShowMenu($hGui, $msg, $OptionsContext)

			Case $HelpBtn
				ShowMenu($hGui, $msg, $HelpContext)

			Case $HelpAbout
				MsgBox(64, "&Uuml;ber...", "GUICtrlGetHandle-Beispiel")
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example2


; Zeigt ein Men&uuml; zugeh&ouml;rig einem bestimmten GUI-Control in einem bestimmten GUI-Fenster
Func ShowMenu($hWnd, $CtrlID, $nContextID)
	Local $arPos, $x, $y
	Local $hMenu = GUICtrlGetHandle($nContextID)

	$arPos = ControlGetPos($hWnd, "", $CtrlID)

	$x = $arPos[0]
	$y = $arPos[1] + $arPos[3]

	ClientToScreen($hWnd, $x, $y)
	TrackPopupMenu($hWnd, $hMenu, $x, $y)
EndFunc   ;==>ShowMenu


; Passt die Clientkoordinaten (GUI) den Bildschirmkoordinaten (Desktop) an
Func ClientToScreen($hWnd, ByRef $x, ByRef $y)
	Local $stPoint = DllStructCreate("int;int")

	DllStructSetData($stPoint, 1, $x)
	DllStructSetData($stPoint, 2, $y)

	DllCall("user32.dll", "int", "ClientToScreen", "hwnd", $hWnd, "ptr", DllStructGetPtr($stPoint))

	$x = DllStructGetData($stPoint, 1)
	$y = DllStructGetData($stPoint, 2)
	; Freigabe der Struktur nicht unbedingt n&ouml;tig, solange sie lokal ist
	$stPoint = 0
EndFunc   ;==>ClientToScreen


; Zeigt an den angegebenen Koordinaten (x, y) das Popupmen&uuml; (hMenu) zugeh&ouml;rig einem bestimmten GUI-Fenster (hWnd)
Func TrackPopupMenu($hWnd, $hMenu, $x, $y)
	DllCall("user32.dll", "int", "TrackPopupMenuEx", "hwnd", $hMenu, "int", 0, "int", $x, "int", $y, "hwnd", $hWnd, "ptr", 0)
EndFunc   ;==>TrackPopupMenu
