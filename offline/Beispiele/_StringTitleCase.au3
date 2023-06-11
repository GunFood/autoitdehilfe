#include <MsgBoxConstants.au3>
#include <String.au3>

Local $sString = "'sie' ist 'was' ICH, wILL (" & '1. "Disk" von 2)'
MsgBox($MB_SYSTEMMODAL, '', 'Original String: ' & $sString & @CRLF & _ ; Anzeige des ursprünglichen Titels
		'Groß-kleingeschriebener String: ' & _StringTitleCase($sString) & @CRLF)
