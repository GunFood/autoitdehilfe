#include <IE.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Notification now is " & _IEErrorNotify())

ConsoleWrite(@CRLF)
ConsoleWrite('! Schau, was passiert, wenn _IEErrorNotify aktiviert ist' & @CRLF)
Local $oIE = _IECreate('www.google') ; URL ist kaputt
Local $oForm = _IEFormGetObjByName($oIE, "gbqf")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
_IEQuit($oIE)
ConsoleWrite('! Das kannst du in der Konsole sehen, wenn _IEErrorNotify aktiviert ist' & @CRLF)

ConsoleWrite(@CRLF)
_IEErrorNotify_ON_OFF()
MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Benachrichtigung lautet nun " & _IEErrorNotify())

ConsoleWrite(@CRLF)
ConsoleWrite('! Schau, was passiert, wenn _IEErrorNotify ausgeschaltet ist' & @CRLF)
$oIE = _IECreate('www.google') ; URL ist kaputt
$oForm = _IEFormGetObjByName($oIE, "gbqf")
; $oForm = _IEFormGetObjByName($oIE, "gbqf")
$oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
_IEQuit($oIE)
ConsoleWrite('! Das siehst du in der Konsole, wenn _IEErrorNotify ausgeschaltet ist' & @CRLF)
ConsoleWrite(@CRLF)

_IEErrorNotify_ON_OFF()
MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Benachrichtigung lautet nun " & _IEErrorNotify())
ConsoleWrite(@CRLF)

ConsoleWrite(@CRLF)
ConsoleWrite('! Schau, was passiert, wenn _IEErrorNotify mit einigen Errors eingeschaltet ist' & @CRLF)
$oIE = _IECreate('www.google.com') ; URL ist OK
$oForm = _IEFormGetObjByName($oIE, "gbqf", 1) ; Versuch, den Index abzurufen. Index = 1 -> ERROR
$oQuery = _IEFormElementGetObjByName($oForm, "q", 1) ; Versuch, den Index abzurufen. Index = 1 -> ERROR
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
_IEQuit($oIE)
ConsoleWrite('! Das kannst du in der Konsole sehen, wenn _IEErrorNotify aktiviert ist' & @CRLF)

Func _IEErrorNotify_ON_OFF()
	If _IEErrorNotify() Then
		MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Die Benachrichtigung ist eingeschaltet und wird ausgeschaltet")
		ConsoleWrite('> Schalte _IEErrorNotify aus' & @CRLF)
		_IEErrorNotify(False)
	Else
		MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Die Benachrichtigung ist ausgeschaltet und wird eingeschaltet")
		ConsoleWrite('> Schalte _IEErrorNotify an' & @CRLF)
		_IEErrorNotify(True)
	EndIf
EndFunc   ;==>_IEErrorNotify_ON_OFF
