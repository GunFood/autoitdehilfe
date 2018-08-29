#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Local $oInternet = ObjCreate("InternetExplorer.Application")
$oInternet.Navigate("http://www.google.com") ; Öffnet eine Webseite, die ein Formular beinhaltet
Sleep(4000) ; Gibt der Seite Zeit zu laden

Local $oDoc = $oInternet.Document ; Zu testendes Beispielobjekt
Local $oForm = $oDoc.Forms(0) ; Zu testendes Beispielobjekt

MsgBox(0, "", "Interface-Name von $oInternet ist: " & ObjName($oInternet) & @CRLF & _
		"Objekt-Name von $oInternet ist:    " & ObjName($oInternet, $OBJ_STRING) & @CRLF & _
		"Interface-Name von $oDoc ist:      " & ObjName($oDoc) & @CRLF & _
		"Objekt-Name von $oDoc ist:         " & ObjName($oDoc, $OBJ_STRING) & @CRLF & _
		"Interface-Name von $oForm ist:     " & ObjName($oForm) & @CRLF & _
		"Objekt-Name von $oForm ist:        " & ObjName($oForm, $OBJ_STRING))
$oInternet.Quit()
