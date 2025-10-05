; == Example 2 : Header Hit Test from an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK if run in different Mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	; Do a hit test on column 2
	Local $aHT = _GUICtrlHeader_HitTest($hHeader, 250, 10)
	_MemoWrite("Item index ...................: " & $aHT[0])
	_MemoWrite("In client window .............: " & $aHT[1])
	_MemoWrite("In control rectangle .........: " & $aHT[2])
	_MemoWrite("On divider ...................: " & $aHT[3])
	_MemoWrite("On zero width divider ........: " & $aHT[4])
	_MemoWrite("Over filter area .............: " & $aHT[5])
	_MemoWrite("Over filter button ...........: " & $aHT[6])
	_MemoWrite("Above bounding rectangle .....: " & $aHT[7])
	_MemoWrite("Below bounding rectangle .....: " & $aHT[8])
	_MemoWrite("To right of bounding rectangle: " & $aHT[9])
	_MemoWrite("To left of bounding rectangle : " & $aHT[10])

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
