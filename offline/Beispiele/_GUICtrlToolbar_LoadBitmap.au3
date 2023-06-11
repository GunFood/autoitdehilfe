#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>


Example()

Func Example()
	Local $hGui, $hToolbar
	Local Enum $e_idRed = 1000, $e_idGreen, $e_idBlue
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	GUISetState(@SW_SHOW)

	; Fügt Bitmaps hinzu
	_GUICtrlToolbar_LoadBitmap($hToolbar, $sPath & "\Examples\GUI\advanced\images\Red.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, $sPath & "\Examples\GUI\advanced\Images\Green.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, $sPath & "\Examples\GUI\advanced\Images\Blue.bmp")

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $e_idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idBlue, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
