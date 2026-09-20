# Sistema de Control de Estacionamiento — Examen Parcial II

## Introducción y Propósito
Este repositorio reúne el desarrollo completo del Examen Parcial II, el cual consiste en una solución integral para la administración y control de un estacionamiento. El proyecto abarca dos componentes principales: la lógica de la aplicación desarrollada en Java mediante Programación Orientada a Objetos (POO) y el diseño e implementación de una base de datos relacional en PostgreSQL para el registro persistente de los vehículos.

---

## Desarrollo en Java (IntelliJ IDEA)
La aplicación fue construida utilizando Java y gestionada con Maven. El código está organizado bajo una estructura modular para mantener una separación clara entre la representación de los datos, la lógica de negocio y la interacción con el usuario.

* **Modelos y Herencia:** Se creó una clase abstracta base denominada `Vehiculo` de la cual heredan las subclases `Automovil` y `Motocicleta`. Esto permite aplicar tarifas diferenciadas y reglas de cálculo según la naturaleza del vehículo.
* **Lógica de Negocio (`service`):** En la clase `EstacionamientoService` se concentran los métodos para registrar el ingreso de vehículos, calcular los cobros en función del tiempo de permanencia, listar los registros actuales y gestionar la desactivación o modificación de datos.
* **Interfaz de Consola (`Main`):** Proporciona un menú interactivo que guía al usuario en la ejecución de las distintas operaciones de forma clara.

---

## Base de Datos y Scripts SQL (PostgreSQL)
Para el almacenamiento persistente se diseñó la base de datos `parcial2_estacionamiento` y la tabla `vehiculo`. La estructura incluye restricciones de integridad avanzadas para asegurar la validez de la información:

```sql
DROP TABLE IF EXISTS vehiculo;

CREATE TABLE vehiculo (
    id SERIAL PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    propietario VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    hora_ingreso VARCHAR(10) NOT NULL,
    horas_utilizadas NUMERIC(5, 2) NOT NULL CONSTRAINT chk_horas_positivas CHECK (horas_utilizadas > 0),
    costo NUMERIC(8, 2) NOT NULL CONSTRAINT chk_costo_no_negativo CHECK (costo >= 0),
    activo BOOLEAN NOT NULL DEFAULT TRUE
);
