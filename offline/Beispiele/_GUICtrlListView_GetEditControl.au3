#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Global $g_hListView, $g_idMemo

Example()

Func Example()
	Local $hGui, $hImage

	$hGui = GUICreate("ListView: Ermittelt das Handle zu dem Änderungscontrol", 500, 300, Default, Default, Default, $WS_EX_CLIENTEDGE)
	$g_hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 118, BitOR($LVS_EDITLABELS, $LVS_REPORT))
	$g_idMemo = GUICtrlCreateEdit("", 2, 124, 396, 174, 0)
	_GUICtrlListView_SetExtendedListViewStyle($g_hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER))
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_hListView), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_hListView), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_hListView), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($g_hListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 3", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 3: Spalte 1", 2)

	; Ändert das Label von Item 0 mit einem Timeout
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	_GUICtrlListView_EditLabel($g_hListView, 0)
	MemoWrite("Edit Handle: 0x" & Hex(_GUICtrlListView_GetEditControl($g_hListView)) & _
			" IsPtr = " & IsPtr(_GUICtrlListView_GetEditControl($g_hListView)) & " IsHWnd = " & IsHWnd(_GUICtrlListView_GetEditControl($g_hListView)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $tInfo, $hWndListView = $g_hListView
	If Not IsHWnd($g_hListView) Then $hWndListView = GUICtrlGetHandle($g_hListView)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_BEGINLABELEDITA, $LVN_BEGINLABELEDITW ; Beginn der Änderung der Bezeichnung eines Items
					$tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
					_DebugPrint("$LVN_BEGINLABELEDIT" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->State:" & @TAB & DllStructGetData($tInfo, "State") & @CRLF & _
							"-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @CRLF & _
							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @CRLF & _
							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
							"-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @CRLF & _
							"-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @CRLF & _
							"-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
					Return False ; Erlaubt dem Benutzer, die Bezeichnung zu ändern
					;Return True  ; Verbietet dem Benutzer, die Bezeichnung zu ändern
				Case $LVN_COLUMNCLICK ; Es wurde auf eine Spalte geklickt
					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
					_DebugPrint("$LVN_COLUMNCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					; Kein Rückgabewert
				Case $LVN_ENDLABELEDITA, $LVN_ENDLABELEDITW ; Ende der Änderung der Bezeichnung eines Items
					$tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
					If (DllStructGetData($tInfo, "Text") <> 0) Then
						Local $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
						_DebugPrint("$LVN_ENDLABELEDIT" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
								"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
								"-->Code:" & @TAB & $iCode & @CRLF & _
								"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
								"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
								"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
								"-->State:" & @TAB & DllStructGetData($tInfo, "State") & @CRLF & _
								"-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @CRLF & _
								"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @CRLF & _
								"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @CRLF & _
								"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
								"-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @CRLF & _
								"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
								"-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @CRLF & _
								"-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @CRLF & _
								"-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
						; Wenn das Input-Control nicht leer ist, führt der Rückgabewert True zum Übernehmen des Textes als Itembezeichnung, False verwirft den eingegebenen Text.
						Return True
					EndIf
					; Wenn das Input-Control leer ist, wird der Rückgabewert ignoriert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_CLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_DBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein Rückgabewert
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_DebugPrint("$NM_KILLFOCUS" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_RCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedrückt
					_DebugPrint("$NM_RETURN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $NM_SETFOCUS ; Das Control erhält den Eingabefokus
					_DebugPrint("$NM_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
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

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
