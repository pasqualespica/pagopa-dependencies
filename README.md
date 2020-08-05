# pagopa-dependencies

La seguente lista contiene tutte le dipendenze necessarie alla compilazione del NodoSPC.

### Legenda 

- **name** : nome dellla dipendenza
  - **type** : Tipo di dipendnza es. : *devDependencies* modulo usato durante lo sviluppo, mentre - *dependencies* moduli richiesti a runtime.
  - **version** : versione della dipendenza ( dove applicabile )
  - **license** : tipo di licenza 
  - **reference** : riferimento repo o latro dopo poterla receuperare se pubblica
  - **note** : motivo per cui si utilizza la dipendenza o altro info utili

---

- `ojdbc8`:
  - dependencies
  - 12.2.0.1
  - BSD
  - https://mvnrepository.com/artifact/com.github.noraui/ojdbc8/12.2.0.1
  - Oracle JDBC Driver

- `cinnamon` :
  - devDependencies
  - 2.11.3
  - Apache License Version 2.0
  - com.lightbend.cinnamon
  - Lightbend Telemetry uses a Java Agent to add specially crafted instrumentation to the components of our platforms which facilitates efficient telemetry.
  **To gain access to Lightbend Telemetry you must have a Lightbend subscription and Lightbend account.**

> *WorkInProgres...*

---

## Useful command to check difference among repo

Lo script `check_dir.sh` prende in input due cartelle e verifica che i files con lo stesso nome (e estensione) siano uguali altrimenti mostra le differenze.

Lo scopo principale e' quello di vedere le differenze dei files `wsdl` e `xsd` presenti nei repo [pagopa-api](https://github.com/pagopa/pagopa-api) e [pagopa-nodo4-common-xml](pagopa-api](https://github.com/pagopa/pagopa-nodo4-common-xml)) che e' possibile sapere digitando da terminale :

> **NOTA** *si suppone che in locale si sia fatto il clone dei repo `pagopa-api` e `pagopa-nodo4-common-xml`*
```
./check_dir.sh ../pagopa-api/ ../pagopa-nodo4-common-xml/
```
che resituisce il seguente output se sono differenti 
```
Start... ../pagopa-api/ and ../pagopa-nodo4-common-xml/ are different !!!
```
aggiungendo l'opzione `-v` ( oppure anche `-vv`) e possbile avere maggiori informazioni:

```
./check_dir.sh -v ../pagopa-api/ ../pagopa-nodo4-common-xml/

Start...
>>>>>>>>>>>>>>>>>>>>
>>> common files >>>
>>>>>>>>>>>>>>>>>>>>
CdPerNodo.wsdl
NodoPerPa.wsdl
NodoPerPsp.wsdl
NodoPerPspRichiestaAvvisi.wsdl
PaPerNodo.wsdl
PaPerNodoPagamentoPsp.wsdl
PaPerNodoRichiestaAvvisi.wsdl
PspPerNodo.wsdl
>>>>>>>>>>>>>>>>>>>>
>>> only into ../pagopa-nodo4-common-xml/
>>>>>>>>>>>>>>>>>>>>
NodoPerPSPChiediElencoAvvisiDigitali.wsdl
NodoPerPSPIscrizioniAvvisatura.wsdl
NodoPerPaAvvisiDigitali.wsdl
PSPPerNodoAvvisiDigitali.wsdl
PaPerNodoChiediElencoAvvisiDigitali.wsdl
>>>>>>>>>>>>>>>>>>>>
>>> only into ../pagopa-api/
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>> DEFAULT filter *.wsdl applied
>>>>>>>>>>>>>>>>>>>>
differences for CdPerNodo.wsdl are : 0
differences for NodoPerPa.wsdl are : 31
differences for NodoPerPsp.wsdl are : 88
differences for NodoPerPspRichiestaAvvisi.wsdl are : 25
differences for PaPerNodo.wsdl are : 10
differences for PaPerNodoPagamentoPsp.wsdl are : 39
differences for PaPerNodoRichiestaAvvisi.wsdl are : 25
differences for PspPerNodo.wsdl are : 34
../pagopa-api/ and ../pagopa-nodo4-common-xml/ are different !!!
```

Tale script sara' aggiunto in un workflow di [GitHub-Actions](https://github.com/actions)
al fine di garantire l'allineamento dei due repo sopra citati, fino a quando ci sara' necessita di averli in ambienti separati.



