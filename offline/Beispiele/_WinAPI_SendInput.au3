#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>
#include <WinAPISys.au3>
#include <WinAPIvkeysConstants.au3>

Example()

Func Example()

	#cs ==========================================================
		https://www.autoitscript.com/forum/topic/210029-keypress-simulation-with-winapi-functions-directly/#comment-1518451

	    Using the SendInput win32 API, this example sends a string
	    of "a" to the last active notepad instance (if it exists).

	    Note:
	    If user press other keys while the string of "a" is sent,
	    they are buffered and displayed AFTER the string of "a"

	    This is a huge difference with the Send() function where
	    the display would be intermingled when you send for ex.
	    a string of 5.000 "a" with a single Send() instruction.

		The SendInput function works by injecting a series of simulated input events into a device's input stream.
		The effect is similar to calling the keybd_event or mouse_event function repeatedly, except that the system ensures that no other input events intermingle with the simulated events.
		When the call completes, the return value indicates the number of input events successfully played. If this value is zero, then input was blocked.
	#ce ==========================================================

	; Line moved inside the function, or the script won't run with AutoIt 3.3.14.5 ("includes chain" changed from 3.3.14.5 to 3.3.16.1)

	Local $iNumberOfInputs = 500 * 2 ; => 1000 inputs (press/release) => 500 chars displayed
	If $iNumberOfInputs < 2 Or (($iNumberOfInputs / 2) <> Int($iNumberOfInputs / 2)) Then _
			Exit MsgBox($MB_ICONERROR, "$iNumberOfInputs", "It has to be an even number, greater or equal to 2")

	;Create a struct to get size
	Local $tKeybdInput = DllStructCreate($tagKEYBDINPUT)

	;Create an inputs array buffer
	Local $tInputArray = DllStructCreate(StringFormat("byte bytes[%i];", DllStructGetSize($tKeybdInput) * $iNumberOfInputs))

	For $i = 0 To $iNumberOfInputs - 3 Step 2

		;Load input array[$i]
		$tKeybdInput = DllStructCreate($tagKEYBDINPUT, DllStructGetPtr($tInputArray) + ($i * DllStructGetSize($tKeybdInput)))
		$tKeybdInput.wVk = $VK_A

		;Load input array[$i + 1]
		$tKeybdInput = DllStructCreate($tagKEYBDINPUT, DllStructGetPtr($tInputArray) + (($i + 1) * DllStructGetSize($tKeybdInput)))
		$tKeybdInput.wvk = $VK_A
		$tKeybdInput.dwFlags = $KEYEVENTF_KEYUP
	Next

	;Load input array[$i]
	$tKeybdInput = DllStructCreate($tagKEYBDINPUT, DllStructGetPtr($tInputArray) + ($i * DllStructGetSize($tKeybdInput)))
	$tKeybdInput.wVk = $VK_RETURN

	;Load input array[$i + 1]
	$tKeybdInput = DllStructCreate($tagKEYBDINPUT, DllStructGetPtr($tInputArray) + (($i + 1) * DllStructGetSize($tKeybdInput)))
	$tKeybdInput.wvk = $VK_RETURN
	$tKeybdInput.dwFlags = $KEYEVENTF_KEYUP

	;Activate notepad window
	If Not WinActivate("[CLASS:Notepad]") Then
		Run("notepad.exe")
		WinWaitActive("[CLASS:Notepad]")
	EndIf

	;Send input
	Local $nResult = _WinAPI_SendInput($INPUT_KEYBOARD, $iNumberOfInputs, $tInputArray)

	If $nResult = 0 Then
		MsgBox(0, "GetLastError", _WinAPI_GetLastErrorMessage())
	ElseIf $nResult <> $iNumberOfInputs Then
		MsgBox(0, "Warning", $nResult & " keyboard events returned (it should have been " & $iNumberOfInputs & ")")
	EndIf

EndFunc   ;==>Example
