#include <Extras\WM_NOTIFY.au3>
#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $g_hMonthCal, $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("MonthCal: Erzeugen (v" & @AutoItVersion & ")", 400, 300)
	$g_hMonthCal = _GUICtrlMonthCal_Create($hGUI, 4, 4, $WS_BORDER)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $g_hMonthCal
			Switch $iCode
				Case $MCN_GETDAYSTATE ; Wird vom MonthCal-Control gesendet, um Informationen zu erhalten, wie individuelle Tage angezeigt werden sollen
					_WM_NOTIFY_DebugEvent("$MCN_GETDAYSTATE", $tagNMDAYSTATE, $lParam, "IDFrom,,Year,Month,DOW,Day,,Hour,Minute,Second,MSecond,DayState,pDayState")
					; Adresse eines Array's von MONTHDAYSTATE (DWORD Bit-Feld, welches den Status jedes Monatstages enthält)
					; Jedes Bit (1 bis 31) repräsentiert den Status eines Tages im Monat. Ist ein Bit True, wird der Tag
					; In Fettdruck angezeigt; andererseits wird er ohne Hervorhebungen angezeigt
					; Kein Rückgabewert
				Case $MCN_SELCHANGE ; Wird vom MonthCal-Control gesendet, wenn sich das aktuell gewählte Datum oder der Datumsbereich ändert
					_WM_NOTIFY_DebugEvent("$MCN_SELCHANGE", $tagNMSELCHANGE, $lParam, "IDFrom,,BegYear,BegMonth,BegDOW,BegDay,,BegHour,BegMinute,BegSecond,BegMSecond,,EndYear,EndMonth,EndDOW,EndDay,,EndHour,EndMinute,EndSecond,EndMSeconds")
					; Kein Rückgabewert
				Case $MCN_SELECT ; Wird vom MonthCal-Control gesendet, wenn der Benutzer ein spezielles Datum innerhalb des MonthCal-Control wählt
					_WM_NOTIFY_DebugEvent("$MCN_SELECT", $tagNMSELCHANGE, $lParam, "IDFrom,,BegYear,BegMonth,BegDOW,BegDay,,BegHour,BegMinute,BegSecond,BegMSecond,,EndYear,EndMonth,EndDOW,EndDay,,EndHour,EndMinute,EndSecond,EndMSeconds")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
