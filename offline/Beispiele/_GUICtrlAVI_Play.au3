; verwendet die AuotIt-Funktion

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Example_Internal()

Func _Example_Internal()
	Local $idAVI, $id_Start, $id_Stop

	; Erstellt eine GUI
	GUICreate("AVI: Abspielen / Stoppen (Intern)", 300, 200)
	$idAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	$id_Start = GUICtrlCreateButton("Start", 50, 150, 70, 22)
	$id_Stop = GUICtrlCreateButton("Stopp", 150, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $id_Start
				; Spielt einen Tel des AVI Clips ab
				_GUICtrlAVI_Play($idAVI)
			Case $id_Stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($idAVI)
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($idAVI)

	GUIDelete()
EndFunc   ;==>_Example_Internal
