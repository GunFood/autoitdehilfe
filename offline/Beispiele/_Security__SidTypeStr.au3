#include <Security.au3>
#include <SecurityConstants.au3>

ConsoleWrite("Der SID Typ für $SIDTYPEDOMAIN lautet: " & _Security__SidTypeStr($SIDTYPEDOMAIN) & @CRLF)
