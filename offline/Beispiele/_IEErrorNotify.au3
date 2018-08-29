#include <IE.au3>
#include <MsgBoxConstants.au3>

; Prüft den aktuellen Status von _IEErrorNotify und schaltet ihn um.

If _IEErrorNotify() Then
	MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Notification is ON, turning it OFF")
	_IEErrorNotify(False)
Else
	MsgBox($MB_SYSTEMMODAL, "_IEErrorNotify Status", "Notification is OFF, turning it ON")
	_IEErrorNotify(True)
EndIf
