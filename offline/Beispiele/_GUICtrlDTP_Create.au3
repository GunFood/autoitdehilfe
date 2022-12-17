#include <Extras\WM_NOTIFY.au3>
#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <WindowsConstants.au3>

Global $g_hDTP

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("DateTimePick: Erstellen (v" & @AutoItVersion & ")", 400, 300)
	$g_hDTP = _GUICtrlDTP_Create($hGUI, 2, 6, 190)
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($g_hDTP, "ddd MMM dd, yyyy hh:mm ttt")

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
		Case $g_hDTP
			Switch $iCode
				Case $DTN_CLOSEUP ; Gesendet durch ein DTP-Control, wenn der Benutzer den Drop-Down Monatskalender schließt.
					_WM_NOTIFY_DebugEvent("$DTN_CLOSEUP", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Der Rückgabewert der Anzeige wird nicht benutzt.
				Case $DTN_DATETIMECHANGE ; Gesendet durch ein DTP-Control, wenn eine Veränderung auftritt.
					_WM_NOTIFY_DebugEvent("$DTN_DATETIMECHANGE", $tagNMDATETIMECHANGE, $lParam, "IDFrom,,Flag,Year,Month,DOW,Day,,Hour,Minute,Second,MSecond")
					Return 0
				Case $DTN_DROPDOWN ; Gesendet durch ein DTP-Control, wenn der Benutzer den Drop-Down Monatskalender aktiviert.
					_WM_NOTIFY_DebugEvent("$DTN_DROPDOWN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Der Rückgabewert der Anzeige wird nicht benutzt.
				Case $DTN_FORMAT, $DTN_FORMATW ; Gesendet durch ein DTP-Control, wenn Text angefordert wird um in einem Callback Feld dargestellt zu werden.
					_WM_NOTIFY_DebugEvent("$DTN_FORMAT", $tagNMDATETIMEFORMAT, $lParam, "IDFrom,,*Format,Year,Month,DOW,Day,,Hour,Minute,Second,MSecond,*pDisplay")
					Return 0
				Case $DTN_FORMATQUERY, $DTN_FORMATQUERYW ; Gesendet durch ein DTP-Control, um die maximal erlaubte Größe des Strings zu ermitteln, der in einem Callback Feld dargestellt werden soll.
					_WM_NOTIFY_DebugEvent("$DTN_FORMATQUERY", $tagNMDATETIMEFORMATQUERY, $lParam, "IDFrom,,*Format,SizeX,SizeY")
					Local $tInfo = DllStructCreate($tagNMDATETIMEFORMATQUERY, $lParam)
					DllStructSetData($tInfo, "SizeX", 64)
					DllStructSetData($tInfo, "SizeY", 10)
					Return 0
				Case $DTN_USERSTRING, $DTN_USERSTRINGW ; Gesendet durch ein DTP-Control, wenn ein Benutzer mit dem bearbeiten eines Strings in dem Control fertig ist.
					_WM_NOTIFY_DebugEvent("$DTN_USERSTRING", $tagNMDATETIMESTRING, $lParam, "IDFrom,,*UserString,Year,Month,DOW,Day,,Hour,Minute,Second,MSecond,Flags")
					Return 0
				Case $DTN_WMKEYDOWN, $DTN_WMKEYDOWNW ; Gesendet durch ein DTP-Control, wenn der Benutzer etwas in ein Callback Feld einträgt.
					_WM_NOTIFY_DebugEvent("$DTN_WMKEYDOWN", $tagNMDATETIMEFORMATQUERY, $lParam, "IDFrom,,VirtKey,*Format,Year,Month,DOW,Day,,Hour,Minute,Second,MSecond")
					Return 0
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
