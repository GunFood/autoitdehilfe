#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI.
	Local $hGUI1 = GUICreate("Beispiel GUI1")
	; Erstellt einen Button.
	Local $idButton1 = GUICtrlCreateButton("Button1", 10, 10, 80, 22)
	; Zeigt die GUI an
	GUISetState(@SW_SHOW, $hGUI1)

	; Erstellt eine GUI.
	Local $hGUI2 = GUICreate("Beispiel GUI2", 300, 300)
	; Erstellt einen Button.
	Local $idButton2 = GUICtrlCreateButton("Button2", 10, 10, 80, 22)
	; Zeigt die GUI an
	GUISetState(@SW_SHOW, $hGUI2)

	; Initialisiert eine Lokale Variable.
	Local $aMsg = 0

	While 1
		; Weist $aMsg die erweiterten GUI Nachrichten zu.
		$aMsg = GUIGetMsg($GUI_EVENT_ARRAY)

		; Schaltet zwischen den GUIs um
		Switch $aMsg[1]
			Case $hGUI1
				; Das Ereignis kommt von GUI1

				; Schaltet zwischen den Ereignis-ID um
				Switch $aMsg[0]
					Case $GUI_EVENT_CLOSE
						ExitLoop
					Case $idButton1
						MsgBox($MB_SYSTEMMODAL, "", "Button1 angeklickt.")
				EndSwitch
			Case $hGUI2
				; Das Ereignis kommt von GUI2

				; Schaltet zwischen den Ereignis-ID um
				Switch $aMsg[0]
					Case $GUI_EVENT_CLOSE
						GUIDelete($hGUI2)
					Case $idButton2
						MsgBox($MB_SYSTEMMODAL, "", "Button2 angeklickt.")
				EndSwitch
		EndSwitch
	WEnd

	; Löscht die vorherigen GUIs und alle Steuerelemente.
	GUIDelete($hGUI1)
EndFunc   ;==>Example
