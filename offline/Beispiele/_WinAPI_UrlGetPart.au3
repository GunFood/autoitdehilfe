#include <APIShPathConstants.au3>
#include <WinAPIShPath.au3>

Local $asUrl = 'http://social.msdn.microsoft.com/search/en-us?query=UrlGetPart'

ConsoleWrite('Schema: ' & _WinAPI_UrlGetPart($asUrl, $URL_PART_SCHEME) & @CRLF)
ConsoleWrite('Host:   ' & _WinAPI_UrlGetPart($asUrl, $URL_PART_HOSTNAME) & @CRLF)
ConsoleWrite('Query:  ' & _WinAPI_UrlGetPart($asUrl, $URL_PART_QUERY) & @CRLF & @CRLF)

$asUrl = 'http://social.msdn.microsoft.com/search/en-ust'

ConsoleWrite('Schema: ' & _WinAPI_UrlGetPart($asUrl, $URL_PART_SCHEME) & @CRLF)
ConsoleWrite('Host:   ' & _WinAPI_UrlGetPart($asUrl, $URL_PART_HOSTNAME) & @CRLF)
ConsoleWrite('Query:  ' & _WinAPI_UrlGetPart($asUrl, $URL_PART_QUERY) & ' @error = ' & @error & ' @extended = 0x' & Hex(@extended) & @CRLF)
