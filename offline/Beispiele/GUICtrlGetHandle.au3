#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI", 300, 200)

	Local $idMnu_File = GUICtrlCreateMenu("&Datei")
	GUICtrlCreateMenuItem("&Öffnen", $idMnu_File)
	GUICtrlCreateMenuItem("&Speichern", $idMnu_File)
	GUICtrlCreateMenuItem("", $idMnu_File)

	Local $idMnu_Options = GUICtrlCreateMenu("O&ptionen", $idMnu_File)
	GUICtrlCreateMenuItem("Ansicht", $idMnu_Options)
	GUICtrlCreateMenuItem("", $idMnu_Options)
	GUICtrlCreateMenuItem("Tools", $idMnu_Options)

	GUICtrlCreateMenuItem("", $idMnu_File)
	Local $idMni_Exit = GUICtrlCreateMenuItem("&Beenden", $idMnu_File)

	Local $idMnu_Help = GUICtrlCreateMenu("&?")
	Local $idMni_About = GUICtrlCreateMenuItem("&Über", $idMnu_Help)

	Local $idBtn_End = GUICtrlCreateButton("Beenden", 110, 140, 70, 20)

	SetMenuColor($idMnu_File, 0xEEBB99) ; RGB Farbwert
	SetMenuColor($idMnu_Options, 0x66BB99) ; RGB Farbwert
	SetMenuColor($idMnu_Help, 0x99BBEE) ; RGB Farbwert

	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()

		Switch $idMsg
			Case $idMni_Exit, $idBtn_End, $GUI_EVENT_CLOSE
				ExitLoop

			Case $idMni_About
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
