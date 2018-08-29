#include <Inet.au3>
#include <MsgBoxConstants.au3>

Local $sAddress = InputBox('Adresse', 'Gib die E-Mail-Adresse des Empfängers ein:')
Local $sSubject = InputBox('Betreff', 'Gib einen Betreff für die E-Mail ein:')
Local $sBody = InputBox('Inhalt', 'Gib den Inhalt der E-Mail-Nachricht ein:')
MsgBox($MB_SYSTEMMODAL, 'Das E-Mail-Programm wurde geöffnet', 'Das E-Mail-Programm wurde geöffnet, dessen Prozess-ID lautet: ' & _INetMail($sAddress, $sSubject, $sBody))
