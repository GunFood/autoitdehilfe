#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $g_hMonthCal

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("MonthCal: Erzeugen", 400, 300)
	$g_hMonthCal = _GUICtrlMonthCal_Create($hGui, 4, 4, $WS_BORDER)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $g_hMonthCal
			Switch $iCode
				Case $MCN_GETDAYSTATE ; Wird vom MonthCal-Control gesendet, um Informationen zu erhalten, wie individuelle Tage angezeigt werden sollen
					$tInfo = DllStructCreate($tagNMDAYSTATE, $lParam)
					_DebugPrint("$MCN_GETDAYSTATE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDVon:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Jahr:" & @TAB & DllStructGetData($tInfo, "Year") & @CRLF & _
							"-->Monat:" & @TAB & DllStructGetData($tInfo, "Month") & @CRLF & _
							"-->TdW:" & @TAB & DllStructGetData($tInfo, "DOW") & @CRLF & _
							"-->Tag:" & @TAB & DllStructGetData($tInfo, "Day") & @CRLF & _
							"-->Stunde:" & @TAB & DllStructGetData($tInfo, "Hour") & @CRLF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @CRLF & _
							"-->Sekunde:" & @TAB & DllStructGetData($tInfo, "Second") & @CRLF & _
							"-->Millisek.:" & @TAB & DllStructGetData($tInfo, "MSecond") & @CRLF & _
							"-->TagStatus:" & @TAB & DllStructGetData($tInfo, "DayState") & @CRLF & _
							"-->pTagStatus:" & @TAB & DllStructGetData($tInfo, "pDayState"))
					; Adresse eines Array's von MONTHDAYSTATE (DWORD Bit-Feld, welches den Status jedes Monatstages enthält)
					; Jedes Bit (1 bis 31) repräsentiert den Status eines Tages im Monat. Ist ein Bit True, wird der Tag
					; In Fettdruck angezeigt; andererseits wird er ohne Hervorhebungen angezeigt
					; Kein Rückgabewert
				Case $MCN_SELCHANGE ; Wird vom MonthCal-Control gesendet, wenn sich das aktuell gewählte Datum oder der Datumsbereich ändert
					$tInfo = DllStructCreate($tagNMSELCHANGE, $lParam)
					_DebugPrint("$MCN_SELCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDVon:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->AnfJahr:" & @TAB & DllStructGetData($tInfo, "BegYear") & @CRLF & _
							"-->AnfMonat:" & @TAB & DllStructGetData($tInfo, "BegMonth") & @CRLF & _
							"-->AnfTdW:" & @TAB & DllStructGetData($tInfo, "BegDOW") & @CRLF & _
							"-->AnfTag:" & @TAB & DllStructGetData($tInfo, "BegDay") & @CRLF & _
							"-->AnfStunde:" & @TAB & DllStructGetData($tInfo, "BegHour") & @CRLF & _
							"-->AnfMinute:" & @TAB & DllStructGetData($tInfo, "BegMinute") & @CRLF & _
							"-->AnfSekunde:" & @TAB & DllStructGetData($tInfo, "BegSecond") & @CRLF & _
							"-->AnfMilliSek.:" & @TAB & DllStructGetData($tInfo, "BegMSeconds") & @CRLF & _
							"-->EndeJahr:" & @TAB & DllStructGetData($tInfo, "EndYear") & @CRLF & _
							"-->EndeMonat:" & @TAB & DllStructGetData($tInfo, "EndMonth") & @CRLF & _
							"-->EndeTdW:" & @TAB & DllStructGetData($tInfo, "EndDOW") & @CRLF & _
							"-->EndeTag:" & @TAB & DllStructGetData($tInfo, "EndDay") & @CRLF & _
							"-->EndeStunde:" & @TAB & DllStructGetData($tInfo, "EndHour") & @CRLF & _
							"-->EndeMinute:" & @TAB & DllStructGetData($tInfo, "EndMinute") & @CRLF & _
							"-->EndeSekunde:" & @TAB & DllStructGetData($tInfo, "EndSecond") & @CRLF & _
							"-->EndeMilliSek.:" & @TAB & DllStructGetData($tInfo, "EndMSeconds"))
					; Kein Rückgabewert
				Case $MCN_SELECT ; Wird vom MonthCal-Control gesendet, wenn der Benutzer ein spezielles Datum innerhalb des MonthCal-Control wählt
					$tInfo = DllStructCreate($tagNMSELCHANGE, $lParam)
					_DebugPrint("$MCN_SELECT" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDVon:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->AnfJahr:" & @TAB & DllStructGetData($tInfo, "BegYear") & @CRLF & _
							"-->AnfMonat:" & @TAB & DllStructGetData($tInfo, "BegMonth") & @CRLF & _
							"-->AnfTdW:" & @TAB & DllStructGetData($tInfo, "BegDOW") & @CRLF & _
							"-->AnfTag:" & @TAB & DllStructGetData($tInfo, "BegDay") & @CRLF & _
							"-->AnfStunde:" & @TAB & DllStructGetData($tInfo, "BegHour") & @CRLF & _
							"-->AnfMinute:" & @TAB & DllStructGetData($tInfo, "BegMinute") & @CRLF & _
							"-->AnfSecond:" & @TAB & DllStructGetData($tInfo, "BegSecond") & @CRLF & _
							"-->AnfMilliSek.:" & @TAB & DllStructGetData($tInfo, "BegMSeconds") & @CRLF & _
							"-->EndeJahr:" & @TAB & DllStructGetData($tInfo, "EndYear") & @CRLF & _
							"-->EndeMonat:" & @TAB & DllStructGetData($tInfo, "EndMonth") & @CRLF & _
							"-->EndeTdW:" & @TAB & DllStructGetData($tInfo, "EndDOW") & @CRLF & _
							"-->EndeTag:" & @TAB & DllStructGetData($tInfo, "EndDay") & @CRLF & _
							"-->EndeStunde:" & @TAB & DllStructGetData($tInfo, "EndHour") & @CRLF & _
							"-->EndeMinute:" & @TAB & DllStructGetData($tInfo, "EndMinute") & @CRLF & _
							"-->EndeSekunde:" & @TAB & DllStructGetData($tInfo, "EndSecond") & @CRLF & _
							"-->EndeMilliSek.:" & @TAB & DllStructGetData($tInfo, "EndMSeconds"))
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $sLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $sLine) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
