; verwendet die UDF

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Beispiel_External()

Func _Beispiel_External()
	Local $hGui, $hAVI, $idBtn_Start, $idBtn_Stop

	; Erstellt eine GUI
	$hGui = GUICreate("AVI: Abspielen (Extern)", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGui, @SystemDir & "\Shell32.dll", 160, 10, 10)
	$idBtn_Start = GUICtrlCreateButton("Start", 50, 150, 70, 22)
	$idBtn_Stop = GUICtrlCreateButton("Stopp", 150, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_Start
				; Spielt einen Tel des AVI Clips ab
				_GUICtrlAVI_Play($hAVI)
			Case $idBtn_Stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($hAVI)
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Beispiel_External
