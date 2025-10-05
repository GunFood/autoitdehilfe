; == Example 2 : Header Layout from an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK if run in "same Mode"

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	; Get header layout
	Local $tRECT = _WinAPI_GetClientRect($hWin)
	Local $tPos = _GUICtrlHeader_Layout($hHeader, $tRECT)

	; Show header layout
	_MemoWrite("Window handle .....: " & DllStructGetData($tPos, "hWnd"))
	_MemoWrite("Z order handle ....: " & DllStructGetData($tPos, "InsertAfter"))
	_MemoWrite("Horizontal position: " & DllStructGetData($tPos, "X"))
	_MemoWrite("Vertical position .: " & DllStructGetData($tPos, "Y"))
	_MemoWrite("Width .............: " & DllStructGetData($tPos, "CX"))
	_MemoWrite("Height ............: " & DllStructGetData($tPos, "CY"))
	_MemoWrite("Flags .............: " & DllStructGetData($tPos, "Flags"))

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
