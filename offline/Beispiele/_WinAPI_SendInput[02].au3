; == Example 2 : _WinAPI_SendInout() for $INPUT_MOUSE entry

#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>
#include <WinAPISys.au3>
#include <WinAPIvkeysConstants.au3>

Example()

Func Example()
	#cs
		INPUT input;
		input.type = INPUT_MOUSE;
		input.mi.mouseData = 0;
		input.mi.dx = x * (65536 / GetSystemMetrics(SM_CXSCREEN)); //x being coord in pixels
		input.mi.dy =  y * (65536 / GetSystemMetrics(SM_CYSCREEN)); //y being coord in pixels
		input.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE;
		SendInput(1, &input, sizeof(input));
	#ce

	Local $iNumberOfInputs = 1
	Local $x = 100 ; coord in pixels
	Local $Y = 100 ; coord in pixels

	Local $tInputArray = DllStructCreate($tagMOUSEINPUT)
	$tInputArray.mouseData = 0
	$tInputArray.dx = $x * (65536 / _WinAPI_GetSystemMetrics($SM_CXSCREEN)) ; //x being coord in pixels
	$tInputArray.dy = $y * (65536 / _WinAPI_GetSystemMetrics($SM_CYSCREEN)) ; //y being coord in pixels
	$tInputArray.dwFlags = $MOUSEEVENTF_ABSOLUTE + $MOUSEEVENTF_MOVE
	Local $nResult = _WinAPI_SendInput($INPUT_MOUSE, $iNumberOfInputs, $tInputArray)

	If $nResult = 0 Then
		MsgBox(0, "GetLastError", _WinAPI_GetLastErrorMessage())
	ElseIf $nResult <> $iNumberOfInputs Then
		MsgBox(0, "Warning", $nResult & " mouse events returned (it should have been " & $iNumberOfInputs & ")")
	EndIf

EndFunc   ;==>Example
