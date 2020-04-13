; Rechtsklick im Anwendungsbereich, um Kontextmenü anzuzeigen.
; Rechtsklick auf den "OK" Button, um ein Control-spezifisches Kontextmenü anzuzeigen.

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Mein GUI Kontextmenü", 300, 200)

	Local $idContextmenu = GUICtrlCreateContextMenu()

	Local $idNewsubmenu = GUICtrlCreateMenu("Neu", $idContextmenu)
	Local $idNewsubmenuText = GUICtrlCreateMenuItem("Text", $idNewsubmenu)

	Local $idButton = GUICtrlCreateButton("OK", 100, 100, 70, 20)
	Local $idButtoncontext = GUICtrlCreateContextMenu($idButton)
	Local $idMenuAbout = GUICtrlCreateMenuItem("Über Button", $idButtoncontext)

	Local $idMenuOpen = GUICtrlCreateMenuItem("Öffnen", $idContextmenu)
	Local $idMenuSave = GUICtrlCreateMenuItem("Speichern", $idContextmenu)
	GUICtrlCreateMenuItem("", $idContextmenu) ; Trennstrich

	Local $idMenuInfo = GUICtrlCreateMenuItem("Info", $idContextmenu)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
				MsgBox($MB_SYSTEMMODAL, "Button geklickt", 'OK')
			Case $idMenuAbout
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Über')
			Case $idMenuOpen
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Öffnen')
			Case $idMenuSave
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Speichern')
			Case $idMenuInfo
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Info')
			Case $idNewsubmenuText
				MsgBox($MB_SYSTEMMODAL, "Untermenü ausgewählt", 'Text')
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example
