; Dieses Beispiel setzt den GPIB-Bus zurück, nachdem der GIPB-Bus nicht mehr reagiert. Dies kommt zwar selten vor, aber es kann passieren wen ein, an den GIPB-Bus angeschlossenes Gerät, abgestürzt ist.

#include <Visa.au3>

_viGpibBusReset()
