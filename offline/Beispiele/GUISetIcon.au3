#include <GUIConstantsEx.au3>

Example()

Func Example()
	; X64 Support
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"

	; Ermittelt die folgende Icon-Datei. Dies kann im Include-Ordner im Installationspfad von AutoIt gefunden werden.
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\icons\au3.ico"

	GUICreate("Mein neues GUI-Icon") ; Erstellt eine GUI die mittig ausgerichtet ist.

	GUISetIcon($sFile) ; ändert das Icon

	GUISetState(@SW_SHOW); zeigt eine leere Infobox an

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
