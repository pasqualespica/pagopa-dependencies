# pagopa-dependecises

La seguente tabella contiente tutte le dipendenze necessarie alla cmompilazione del NodoSPC.


|name   | type | version    | license | reference  | note |
|:-------------:|:----:|:----------:|:-------:|:----------:|------|
|ojdbc8|dependencies|12.2.0.1|BSD|https://mvnrepository.com/artifact/com.github.noraui/ojdbc8/12.2.0.1|Oracle JDBC Driver|
|cinnamon|devDependencies|2.11.3|Apache License Version 2.0|com.lightbend.cinnamon|Lightbend Telemetry uses a Java Agent to add specially crafted instrumentation to the components of our platforms which facilitates efficient telemetry. *To gain access to Lightbend Telemetry you must have a Lightbend subscription and Lightbend account.* |


### Legenda 

- **name** : nome dellla dipendenza
- **type** : Tipo di dipendnza es. :
  - *devDependencies* modulo usato durante lo sviluppo, mentre
  - *dependencies* moduli richiesti a runtime.
- **version** : versione della dipendenza ( dove applicabile )
- **license** : tipo di licenza 
- **reference** : riferimento repo o latro dopo poterla receuperare se pubblica
- **note** : motivo per cui si utilizza la dipendenza o altro info utili
