#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI", 300, 200)

	Local $idFileMenu = GUICtrlCreateMenu("&Datei")
	GUICtrlCreateMenuItem("&Öffnen", $idFileMenu)
	GUICtrlCreateMenuItem("&Speichern", $idFileMenu)
	GUICtrlCreateMenuItem("", $idFileMenu)

	Local $idOptionsMenu = GUICtrlCreateMenu("O&ptionen", $idFileMenu)
	GUICtrlCreateMenuItem("Ansicht", $idOptionsMenu)
	GUICtrlCreateMenuItem("", $idOptionsMenu)
	GUICtrlCreateMenuItem("Tools", $idOptionsMenu)

	GUICtrlCreateMenuItem("", $idFileMenu)
	Local $idExitItem = GUICtrlCreateMenuItem("&Beenden", $idFileMenu)

	Local $idHelpMenu = GUICtrlCreateMenu("&?")
	Local $idAboutItem = GUICtrlCreateMenuItem("&Über", $idHelpMenu)

	Local $idEndBtn = GUICtrlCreateButton("Beenden", 110, 140, 70, 20)

	SetMenuColor($idFileMenu, 0xEEBB99) ; RGB Farbwert
	SetMenuColor($idOptionsMenu, 0x66BB99) ; RGB Farbwert
	SetMenuColor($idHelpMenu, 0x99BBEE) ; RGB Farbwert

	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()

		Switch $idMsg
			Case $idExitItem, $idEndBtn, $GUI_EVENT_CLOSE
				ExitLoop

			Case $idAboutItem
				MsgBox($MB_SYSTEMMODAL, "Über", "Farbiges Menübeispiel")
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Farbe im Menü anwenden
Func SetMenuColor($nMenuID, $nColor)
	Local Const $MIM_APPLYTOSUBMENUS = 0x80000000
	Local Const $MIM_BACKGROUND = 0x00000002

	Local $hMenu = GUICtrlGetHandle($nMenuID)

	Local $hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $nColor)
	$hBrush = $hBrush[0]

	Local $tMenuInfo = DllStructCreate("dword;dword;dword;uint;dword;dword;ptr")
	DllStructSetData($tMenuInfo, 1, DllStructGetSize($tMenuInfo))
	DllStructSetData($tMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($tMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "struct*", $tMenuInfo)

	; Freigabe der Struktur nicht erforderlich, solange sie lokal ist
	$tMenuInfo = 0
EndFunc   ;==>SetMenuColor
