#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI die Dateien akzeptiert", 320, 120, @DesktopWidth / 2 - 160, @DesktopHeight / 2 - 45, -1, $WS_EX_ACCEPTFILES)
	Local $idFile = GUICtrlCreateInput("", 10, 5, 300, 20)
	GUICtrlSetState(-1, $GUI_DROPACCEPTED)
	GUICtrlCreateInput("", 10, 35, 300, 20) ; Akzeptiert kein Drag&Drop von Dateien
	Local $idBtn = GUICtrlCreateButton("Ok", 40, 75, 60, 20)

	GUISetState(@SW_SHOW)

	$idMsg = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn
				ExitLoop
		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Drag&Drop Datei", GUICtrlRead($idFile))
EndFunc   ;==>Example
