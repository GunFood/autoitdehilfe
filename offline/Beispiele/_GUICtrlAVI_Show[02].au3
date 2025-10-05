#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Beispiel_External()

Func _Beispiel_External()
	Local $hGui, $hAVI, $idBtn_Start, $idBtn_Stop, $idBtn_Show

	; Erstellt eine GUI
	$hGui = GUICreate("AVI: Abspielen (Extern)", 350, 200)
	$hAVI = _GUICtrlAVI_Create($hGui, @SystemDir & "\Shell32.dll", 160, 10, 10)
	$idBtn_Start = GUICtrlCreateButton("Start", 25, 150, 70, 22)
	$idBtn_stop = GUICtrlCreateButton("Stopp", 125, 150, 70, 22)
	$idBtn_Show = GUICtrlCreateButton("Verstecken", 225, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_Start
				; Spielt einen Teil des AVI Clips
				_GUICtrlAVI_Play($hAVI)
			Case $idBtn_stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($hAVI)
			Case $idBtn_Show
				If GUICtrlRead($idBtn_Show) = "Verstecken" Then
					_GUICtrlAVI_Show($hAVI, @SW_HIDE)
					GUICtrlSetData($idBtn_Show, "Zeigen")
				Else
					_GUICtrlAVI_Show($hAVI, @SW_SHOW)
					GUICtrlSetData($idBtn_Show, "Verstecken")
				EndIf
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($idAVI)

	GUIDelete()
EndFunc   ;==>_Beispiel_External
