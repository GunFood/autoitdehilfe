#include "WinAPISysWin.au3"
#include <GuiListView.au3>
#include <WinAPISysWin.au3>

Example() ; Ein ListView-Steuerelement, das mit einem externen ListView erstellt wurde

Func Example()
	Local $sExternalScript = StringReplace(@ScriptName, "[2]", "")
	Local $iPID = Run(@AutoItExe & " " & $sExternalScript)
	Local $hWin = WinWaitActive("ListView Get Group Info", "")

	Local $hListView = _WinAPI_EnumChildWindows($hWin)[1][0]

	; Ermittelt das Rechteck der Gruppen-ID 2
	Local $aInfo = _GUICtrlListView_GetGroupRect($hListView, 2)
	MsgBox($MB_SYSTEMMODAL, "Information (extern)", "Rechteck :" & @TAB & @TAB & @TAB & @CRLF & _
			@TAB & "Links..: " & $aInfo[0] & @CRLF & _
			@TAB & "Oben...: " & $aInfo[1] & @CRLF & _
			@TAB & "Rechts.: " & $aInfo[2] & @CRLF & _
			@TAB & "Unten..: " & $aInfo[3])

	ProcessClose($iPID)

EndFunc   ;==>Example
