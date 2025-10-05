; verwendet die AutoIt-Funktion

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Beispiel_Internal()

Func _Beispiel_Internal()
	Local $idAvi_AVI, $idBtn_Start, $idBtn_Stop, $idBtn_Show

	; Erstellt eine GUI
	GUICreate("AVI: Abspielen (Intern)", 350, 200)
	$idAvi_AVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	$idBtn_Start = GUICtrlCreateButton("Start", 25, 150, 70, 22)
	$idBtn_Stop = GUICtrlCreateButton("Stopp", 125, 150, 70, 22)
	$idBtn_Show = GUICtrlCreateButton("Verstecken", 225, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_Start
				; Spielt einen Teil des AVI Clips
				_GUICtrlAVI_Play($idAvi_AVI)
			Case $idBtn_Stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($idAvi_AVI)
			Case $idBtn_Show
				If GUICtrlRead($idBtn_Show) = "Verstecken" Then
					_GUICtrlAVI_Show($idAvi_AVI, @SW_HIDE)
					GUICtrlSetData($idBtn_Show, "Zeigen")
				Else
					_GUICtrlAVI_Show($idAvi_AVI, @SW_SHOW)
					GUICtrlSetData($idBtn_Show, "Verstecken")
				EndIf
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($idAvi_AVI)

	GUIDelete()
EndFunc   ;==>_Beispiel_Internal
