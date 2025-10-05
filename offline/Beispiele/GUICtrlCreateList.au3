#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sMESSAGE = "Folgende Buttons wurden gedrückt:"

	GUICreate("Meine GUI List") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	Local $idButton_Add = GUICtrlCreateButton("Hinzufügen", 64, 32, 75, 25)
	Local $idButton_Clear = GUICtrlCreateButton("Leeren", 64, 72, 75, 25)
	Local $idLst_Mylist = GUICtrlCreateList("Buttons, die gedrückt wurden", 176, 32, 221, 97)
	GUICtrlSetLimit(-1, 200) ; Horizontales Scrollen begrenzen
	GUICtrlSetData(-1, $sMESSAGE)
	Local $idButton_Close = GUICtrlCreateButton("Mein Beenden-Button", 64, 160, 175, 25)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton_Add
				GUICtrlSetData($idLst_Mylist, "Du hast Button Nr. 1 gedrückt|")
			Case $idButton_Clear
				GUICtrlSetData($idLst_Mylist, "")
			Case $idButton_Close
				MsgBox($MB_SYSTEMMODAL, "", "Der Beenden-Button wurde gedrückt", 2)
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example
