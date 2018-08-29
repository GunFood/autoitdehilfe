#include <MsgBoxConstants.au3>
#include <String.au3>

; Gibt "Somebody Lastnames" zurück
MsgBox($MB_SYSTEMMODAL, '', _StringProper("somebody lastnames"))
; Gibt "Some.Body Last(Name)" zurück
MsgBox($MB_SYSTEMMODAL, '', _StringProper("SOME.BODY LAST(NAME)"))
Exit
