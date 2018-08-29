#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $hHandleBefore, $hMonthCal

	; Erstellt eine GUI
	$hGui = GUICreate("MonthCal: löschen", 400, 300)
	$hMonthCal = _GUICtrlMonthCal_Create($hGui, 4, 4, $WS_BORDER)
	GUISetState(@SW_SHOW)

	$hHandleBefore = $hMonthCal
	MsgBox($MB_SYSTEMMODAL, "Information", "Löscht das Control mit dem Handle: " & $hMonthCal)
	MsgBox($MB_SYSTEMMODAL, "Information", "Control gelöscht: " & _GUICtrlMonthCal_Destroy($hMonthCal) & @CRLF & _
			"Handle vor dem löschen: " & $hHandleBefore & @CRLF & _
			"Handle nach dem löschen: " & $hMonthCal)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
