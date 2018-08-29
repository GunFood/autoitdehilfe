; verwendet die AutoIt-Funktion

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Beispiel_Internal()

Func _Beispiel_Internal()
	Local $id_AVI, $id_Start, $id_Stop, $id_Show

	; Erstellt eine GUI
	GUICreate("AVI: Abspielen (Intern)", 350, 200)
	$id_AVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	$id_Start = GUICtrlCreateButton("Start", 25, 150, 70, 22)
	$id_Stop = GUICtrlCreateButton("Stopp", 125, 150, 70, 22)
	$id_Show = GUICtrlCreateButton("Verstecken", 225, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $id_Start
				; Spielt einen Teil des AVI Clips
				_GUICtrlAVI_Play($id_AVI)
			Case $id_Stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($id_AVI)
			Case $id_Show
				If GUICtrlRead($id_Show) = "Verstecken" Then
					_GUICtrlAVI_Show($id_AVI, @SW_HIDE)
					GUICtrlSetData($id_Show, "Zeigen")
				Else
					_GUICtrlAVI_Show($id_AVI, @SW_SHOW)
					GUICtrlSetData($id_Show, "Verstecken")
				EndIf
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($id_AVI)

	GUIDelete()
EndFunc   ;==>_Beispiel_Internal
