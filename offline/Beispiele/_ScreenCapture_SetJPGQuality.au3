#include <ScreenCapture.au3>

; Screenshot vom kompletten Bildschirm erstellten Qualit�t 100%
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image_100Proz.jpg")
; Screenshot vom kompletten Bildschirm erstellten Qualit�t 50%
_ScreenCapture_SetJPGQuality(50)
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image_50Proz.jpg")
; Screenshot vom kompletten Bildschirm erstellten Qualit�t 30%
_ScreenCapture_SetJPGQuality(30)
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image_30Proz.jpg")
; Screenshot vom kompletten Bildschirm erstellten Qualit�t 20%
_ScreenCapture_SetJPGQuality(20)
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image_20Proz.jpg")
; Screenshot vom kompletten Bildschirm erstellten Qualit�t 5%
_ScreenCapture_SetJPGQuality(5)
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image_5Proz.jpg")