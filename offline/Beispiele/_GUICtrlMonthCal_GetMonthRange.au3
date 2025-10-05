#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: ermittelt Datumsinformationen, welche das höchste und niedrigste Anzeigelimit aufzeigen (v" & @AutoItVersion & ")", 820, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 412, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt Datumsinformationen, welche das höchste und niedrigste Anzeigelimit aufzeigen
	Local $tRange = _GUICtrlMonthCal_GetMonthRange($idMonthCal)
	_MemoWrite("niedrigste Anzeigelimit: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MinMonth"), _
			DllStructGetData($tRange, "MinDay"), _
			DllStructGetData($tRange, "MinYear")))
	_MemoWrite("höchstes Anzeigelimit: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MaxMonth"), _
			DllStructGetData($tRange, "MaxDay"), _
			DllStructGetData($tRange, "MaxYear")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
