PREFIX="/usr/local"
ETCPREFIX="/etc"

install:
	@echo "installing scripts to ${PREFIX}/bin"
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@sed "s#ETCPREFIX#${ETCPREFIX}#g" < scripts/setbat > ${DESTDIR}${SBINPREFIX}/setbat
	@sed "s#ETCPREFIX#${ETCPREFIX}#g" < scripts/setbright > ${DESTDIR}${SBINPREFIX}/setbright
	@sed "s#ETCPREFIX#${ETCPREFIX}#g" < scripts/sitnol > ${DESTDIR}${SBINPREFIX}/sitnol
	@sed "s#ETCPREFIX#${ETCPREFIX}#g" < scripts/suspto > ${DESTDIR}${SBINPREFIX}/suspto
	@sed "s#ETCPREFIX#${ETCPREFIX}#g" < scripts/vmod > ${DESTDIR}${SBINPREFIX}/vmod
	@echo "installing events to ${ETCPREFIX}/acpi/events_available"
	@mkdir -p ${DESTDIR}${ETCPREFIX}/acpi/events_available
	@for i in $(ls events); do sed "s#PREFIX#${PREFIX}#g" < events/$$i > ${DESTDIR}${ETCPREFIX}/acpi/events_available/$$i; done
	@echo "installing config to ${ETCPREFIX}/acpithings.rc"
	@cp -f acpithings.rc ${DESTDIR}${ETCPREFIX}/acpithings.rc

.PHONY: install
