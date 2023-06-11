#include <GUIConstantsEx.au3>

Example()

Func Example()
	; X64 Unterstützung
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"

	Local $hGUI = GUICreate("Beispiel")

	Local $sAutoItInstallDir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir")
	If Not @error Then
		GUISetHelp('hh.exe "' & $sAutoItInstallDir & '\AutoIt.chm"')
	EndIf

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
