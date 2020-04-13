#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <WindowsConstants.au3>

Global $g_hDTP

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("DateTimePick: Erstellen (UDF)", 400, 300)
	$g_hDTP = _GUICtrlDTP_Create($hGui, 2, 6, 190)
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($g_hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo, $tBuffer, $tBuffer2

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $g_hDTP
			Switch $iCode
				Case $DTN_CLOSEUP ; Gesendet durch ein DTP-Control, wenn der Benutzer den Drop-Down Monatskalender schließt.
					_DebugPrint("$DTN_CLOSEUP" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Der Rückgabewert der Anzeige wird nicht benutzt.
				Case $DTN_DATETIMECHANGE ; Gesendet durch ein DTP-Control, wenn eine Veränderung auftritt.
					$tInfo = DllStructCreate($tagNMDATETIMECHANGE, $lParam)
					_DebugPrint("$DTN_DATETIMECHANGE" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->Flag:" & @TAB & DllStructGetData($tInfo, "Flag") & @CRLF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @CRLF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @CRLF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @CRLF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @CRLF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @CRLF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @CRLF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @CRLF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond"))
					Return 0
				Case $DTN_DROPDOWN ; Gesendet durch ein DTP-Control, wenn der Benutzer den Drop-Down Monatskalender aktiviert.
					_DebugPrint("$DTN_DROPDOWN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Der Rückgabewert der Anzeige wird nicht benutzt.
				Case $DTN_FORMAT ; Gesendet durch ein DTP-Control, wenn Text angefordert wird um in einem Callback Feld dargestellt zu werden.
					$tInfo = DllStructCreate($tagNMDATETIMEFORMAT, $lParam)
					$tBuffer = DllStructCreate("char Format[128]", DllStructGetData($tInfo, "Format"))
					$tBuffer2 = DllStructCreate("char Display[64]", DllStructGetData($tInfo, "pDisplay"))
					_DebugPrint("$DTN_FORMAT" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->Format:" & @TAB & DllStructGetData($tBuffer, "Format") & @CRLF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @CRLF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @CRLF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @CRLF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @CRLF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @CRLF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @CRLF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @CRLF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond") & @CRLF & _
							"-->Display:" & @TAB & DllStructGetData($tBuffer2, "Display"))
					Return 0
				Case $DTN_FORMATQUERY ; Gesendet durch ein DTP-Control, um die maximal erlaubte Größe des Strings zu ermitteln, der in einem Callback Feld dargestellt werden soll.
					$tInfo = DllStructCreate($tagNMDATETIMEFORMATQUERY, $lParam)
					$tBuffer = DllStructCreate("char Format[128]", DllStructGetData($tInfo, "Format"))
					_DebugPrint("$DTN_FORMATQUERY" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->Format:" & @TAB & DllStructGetData($tBuffer, "Format") & @CRLF & _
							"-->SizeX:" & @TAB & DllStructGetData($tInfo, "SizeX") & @CRLF & _
							"-->SizeY:" & @TAB & DllStructGetData($tBuffer2, "SizeY"))
					DllStructSetData($tInfo, "SizeX", 64)
					DllStructSetData($tInfo, "SizeY", 10)
					Return 0
				Case $DTN_USERSTRING ; Gesendet durch ein DTP-Control, wenn ein Benutzer mit dem bearbeiten eines Strings in dem Control fertig ist.
					$tInfo = DllStructCreate($tagNMDATETIMESTRING, $lParam)
					$tBuffer = DllStructCreate("char UserString[128]", DllStructGetData($tInfo, "UserString"))
					_DebugPrint("$DTN_USERSTRING" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->UserString:" & @TAB & DllStructGetData($tBuffer, "UserString") & @CRLF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @CRLF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @CRLF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @CRLF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @CRLF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @CRLF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @CRLF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @CRLF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond") & @CRLF & _
							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags"))
					Return 0
				Case $DTN_WMKEYDOWN ; Gesendet durch ein DTP-Control, wenn der Benutzer etwas in ein Callback Feld einträgt.
					$tInfo = DllStructCreate($tagNMDATETIMEFORMATQUERY, $lParam)
					$tBuffer = DllStructCreate("char Format[128]", DllStructGetData($tInfo, "Format"))
					_DebugPrint("$DTN_WMKEYDOWN" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tInfo, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tInfo, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tInfo, "Code") & @CRLF & _
							"-->VirtKey:" & @TAB & DllStructGetData($tInfo, "VirtKey") & @CRLF & _
							"-->Format:" & @TAB & DllStructGetData($tBuffer, "Format") & @CRLF & _
							"-->Year:" & @TAB & DllStructGetData($tInfo, "Year") & @CRLF & _
							"-->Month:" & @TAB & DllStructGetData($tInfo, "Month") & @CRLF & _
							"-->DOW:" & @TAB & DllStructGetData($tInfo, "DOW") & @CRLF & _
							"-->Day:" & @TAB & DllStructGetData($tInfo, "Day") & @CRLF & _
							"-->Hour:" & @TAB & DllStructGetData($tInfo, "Hour") & @CRLF & _
							"-->Minute:" & @TAB & DllStructGetData($tInfo, "Minute") & @CRLF & _
							"-->Second:" & @TAB & DllStructGetData($tInfo, "Second") & @CRLF & _
							"-->MSecond:" & @TAB & DllStructGetData($tInfo, "MSecond"))
					Return 0
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
