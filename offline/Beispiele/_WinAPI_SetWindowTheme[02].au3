; == Example 2 - use of  "", "" or _WinAPI_SetThemeAppProperties(0) to color Checkbox or Radio

#include <APIThemeConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPITheme.au3>

Example()

Func Example()

	GUICreate("_WinAPI_SetWindowTheme (v" & @AutoItVersion & ")", 430, 240)
	GUICtrlCreateLabel(' ThemeAppProperties = "' & GetThemeAppPropertiesToString() & '"', 10, 10, 420)

	GUICtrlCreateCheckbox(@ScriptLineNumber & " No Color", 10, NextHeight(30), 400)

	GUICtrlCreateCheckbox(@ScriptLineNumber & " Set color by AutoIt", 10, NextHeight(), 400)
	GUICtrlSetColor(-1, 0xFF0000)

	GUICtrlCreateCheckbox(@ScriptLineNumber & " Set Window Theme no param", 10, NextHeight(), 400)
	_WinAPI_SetWindowTheme(GUICtrlGetHandle(-1))
	GUICtrlSetColor(-1, 0xFF0000)

	GUICtrlCreateCheckbox(@ScriptLineNumber & " Set Window Theme with Default, Default", 10, NextHeight(), 400)
	_WinAPI_SetWindowTheme(GUICtrlGetHandle(-1), Default, Default)
	GUICtrlSetColor(-1, 0xFF0000)

	GUICtrlCreateCheckbox(@ScriptLineNumber & ' Set Window Theme "", "" MSDN', 10, NextHeight(), 400)
	_WinAPI_SetWindowTheme(GUICtrlGetHandle(-1), "", "")
	GUICtrlSetColor(-1, 0xFF0000)

	GUICtrlCreateCheckbox(@ScriptLineNumber & " Set Window Theme with  Null, Null", 10, NextHeight(), 400)
	_WinAPI_SetWindowTheme(GUICtrlGetHandle(-1), Null, Null)
	GUICtrlSetColor(-1, 0xFF00FF)

	GUICtrlCreateCheckbox(@ScriptLineNumber & " Set Window Theme with  0, 0 >>> 0 = Null >>> ", 10, NextHeight(), 400)
	_WinAPI_SetWindowTheme(GUICtrlGetHandle(-1), 0, 0)
	GUICtrlSetColor(-1, 0xFF00FF)

	_WinAPI_SetThemeAppProperties(0)
	NextHeight()
	GUICtrlCreateLabel(' ThemeAppProperties after SetThemeAppProperties(0) = "' & GetThemeAppPropertiesToString() & '"', 10, NextHeight(), 420)
	GUICtrlCreateCheckbox(@ScriptLineNumber & " Set color by AutoIt with _WinAPI_SetThemeAppProperties(0)", 10, NextHeight(), 400)
	GUICtrlSetColor(-1, 0xFF0000)

	GUISetState()

	While GUIGetMsg() <> $GUI_EVENT_CLOSE
		Sleep(50)
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func GetThemeAppPropertiesToString($iProperties = Default)
	If $iProperties = Default Then $iProperties = _WinAPI_GetThemeAppProperties()

	Local $sProperties = ""
	If BitAnd($iProperties, $STAP_ALLOW_CONTROLS) Then $sProperties &= "STAP_ALLOW_CONTROLS,"
	If BitAnd($iProperties, $STAP_ALLOW_NONCLIENT) Then $sProperties &= "STAP_ALLOW_NONCLIENT,"
	If BitAnd($iProperties, $STAP_ALLOW_WEBCONTENT) Then $sProperties &= "$STAP_ALLOW_WEBCONTENT,"

	Return StringTrimRight($sProperties, 1)
EndFunc   ;==>GetThemeAppPropertiesToString

Func NextHeight($iInit = Default)
	Local Static $iNext = 0
	If $iInit = Default Then
		$iNext += 20
	Else
		$iNext = $iInit
	EndIf
	Return $iNext
EndFunc
