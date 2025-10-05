#include "Extras\HelpFileInternals.au3"

#include <DirConstants.au3>
#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $aList, $idCombo
	Opt("GUIDataSeparatorChar", ",") ; Gib als zweiten Parameter den Separator (Trennzeichen) an, der verwendet werden soll

	; Erstellt eine GUI
	GUICreate("ComboBox: Liste ermitteln", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt alle vorhandenen Laufwerke zur Liste hinzu
	_GUICtrlComboBox_AddDir($idCombo, "", $DDL_DRIVES, False)

	; Inhalt der Liste separieren und ausgeben
	$aList = StringSplit(_GUICtrlComboBox_GetList($idCombo), ",")
	For $x = 1 To $aList[0]
		_MemoWrite($aList[$x])
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example