; Rechtsklick im Anwendungsbereich, um Kontextmenü anzuzeigen.
; Rechtsklick auf den "OK" Button, um ein Control-spezifisches Kontextmenü anzuzeigen.

#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Mein GUI Kontextmenü", 300, 200)

	Local $idContextmenu = GUICtrlCreateContextMenu()

	Local $idMnu_Newsub = GUICtrlCreateMenu("Neu", $idContextmenu)
	Local $idMni_NewsubmenuText = GUICtrlCreateMenuItem("Text", $idMnu_Newsub)

	Local $idButton = GUICtrlCreateButton("OK", 100, 100, 70, 20)
	Local $idCtx_Button = GUICtrlCreateContextMenu($idButton)
	Local $idMni_About = GUICtrlCreateMenuItem("Über Button", $idCtx_Button)

	Local $idMni_Open = GUICtrlCreateMenuItem("Öffnen", $idContextmenu)
	Local $idMni_Save = GUICtrlCreateMenuItem("Speichern", $idContextmenu)
	GUICtrlCreateMenuItem("", $idContextmenu) ; Trennstrich

	Local $idMni_Info = GUICtrlCreateMenuItem("Info", $idContextmenu)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
				MsgBox($MB_SYSTEMMODAL, "Button geklickt", 'OK')
			Case $idMni_About
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Über')
			Case $idMni_Open
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Öffnen')
			Case $idMni_Save
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Speichern')
			Case $idMni_Info
				MsgBox($MB_SYSTEMMODAL, "Menü ausgewählt", 'Info')
			Case $idMni_NewsubmenuText
				MsgBox($MB_SYSTEMMODAL, "Untermenü ausgewählt", 'Text')
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example
