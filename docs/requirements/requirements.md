# Requerimientos del Proyecto

## Requerimientos Funcionales

### BLINK-1: Autenticación de Usuario

- **Identificador:** BLINK-1  
- **Nombre:** Autenticación de Usuario  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Credenciales del usuario (username y password).  
- **Salida:** Token de autenticación válido.  
- **Descripción:**  
  El sistema debe validar las credenciales del usuario y generar un token de autenticación para usos posteriores. La validación se realizará mediante la comunicación RMI con el servidor de autenticación.  
- **Precondiciones:** El usuario debe estar registrado en el sistema.  
- **Flujo Básico:**  
  1. El usuario envía una solicitud de login a través del servicio SOAP, incluyendo sus credenciales.  
  2. El servidor de aplicación invoca el servicio RMI del servidor de autenticación para validar las credenciales.  
  3. Al validarse correctamente, se genera y retorna un token de autenticación.  
- **Flujo Alternativo:**  
  - Si las credenciales son incorrectas, el servidor de autenticación retorna un error y se rechaza el acceso, informando al usuario.

---

### BLINK-2: Creación de Directorios/Subdirectorios

- **Identificador:** BLINK-2  
- **Nombre:** Creación de Directorios/Subdirectorios  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación, nombre del directorio, identificador del directorio padre (opcional).  
- **Salida:** Confirmación de creación y actualización de la estructura del árbol de directorios.  
- **Descripción:**  
  El sistema debe permitir al usuario crear nuevos directorios o subdirectorios, registrando la información en la base de datos a través de la API REST.  
- **Precondiciones:** Usuario autenticado y existencia del directorio padre si se especifica.  
- **Flujo Básico:**  
  1. El usuario envía la solicitud SOAP con el token, el nombre del directorio y, opcionalmente, el ID del directorio padre.  
  2. El servidor de aplicación valida el token y registra el nuevo directorio en la base de datos mediante la API REST.  
  3. Se retorna una confirmación de la creación exitosa.  
- **Flujo Alternativo:**  
  - Si el token es inválido o el directorio padre no existe, se retorna un error notificando la falla.

---

### BLINK-3: Subida/Almacenamiento de Archivos

- **Identificador:** BLINK-3  
- **Nombre:** Subida/Almacenamiento de Archivos  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación, uno o más archivos y sus metadatos (nombre, tamaño, etc.).  
- **Salida:** Confirmación de almacenamiento y ubicación asignada en los nodos de almacenamiento.  
- **Descripción:**  
  El sistema debe permitir a los usuarios subir archivos, distribuyéndolos en diferentes nodos mediante gRPC, registrando sus metadatos en la base de datos a través de la API REST y almacenando copias redundantes de cada archivo en al menos dos nodos.  
- **Precondiciones:** Usuario autenticado y existencia del directorio de destino.  
- **Flujo Básico:**  
  1. El usuario envía una solicitud SOAP con el token y el archivo (o archivos) junto con sus metadatos.  
  2. El servidor de aplicación valida el token y coordina la distribución del archivo entre los nodos utilizando gRPC.  
  3. Se registra la información del archivo en la base de datos mediante la API REST.  
  4. Se asegura que se almacenen copias redundantes del archivo en al menos dos nodos.  
  5. Se retorna una confirmación de éxito.  
- **Flujo Alternativo:**  
  - Si se produce un error en la comunicación con los nodos o en el registro de metadatos, se retorna un mensaje de error y se activa un mecanismo de rollback o reintento.

---

### BLINK-4: Lectura/Descarga de Archivos

- **Identificador:** BLINK-4  
- **Nombre:** Lectura/Descarga de Archivos  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación, identificador o nombre del archivo a descargar.  
- **Salida:** Archivo solicitado en formato descargable.  
- **Descripción:**  
  El sistema debe permitir a los usuarios descargar archivos existentes, recuperándolos desde los nodos de almacenamiento de manera redundante mediante gRPC y consultando sus metadatos en la base de datos mediante la API REST.  
- **Precondiciones:** Usuario autenticado y existencia del archivo con permisos de acceso asignados.  
- **Flujo Básico:**  
  1. El usuario solicita la descarga enviando el token y el identificador del archivo mediante SOAP.  
  2. El servidor valida el token, consulta los metadatos en la base de datos y coordina con los nodos mediante gRPC para recuperar el archivo.  
  3. Se retorna el archivo al usuario.  
- **Flujo Alternativo:**  
  - Si el archivo no existe o el usuario carece de permisos, se retorna un mensaje de error.

---

### BLINK-5: Mover/Renombrar Archivos o Directorios

- **Identificador:** BLINK-5  
- **Nombre:** Mover/Renombrar Archivos o Directorios  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación, identificador del archivo o directorio, nuevo nombre o ubicación destino.  
- **Salida:** Confirmación de actualización de la ubicación o nombre.  
- **Descripción:**  
  El sistema debe permitir a los usuarios mover o renombrar archivos y directorios, actualizando la información en la base de datos mediante la API REST.  
- **Precondiciones:** Usuario autenticado y existencia verificada del recurso a modificar.  
- **Flujo Básico:**  
  1. El usuario envía la solicitud SOAP con el token, el ID del recurso y la información de cambio (nuevo nombre o nueva ubicación).  
  2. El servidor valida el token y la existencia del recurso.  
  3. Se actualiza la información correspondiente en la base de datos a través de la API REST.  
  4. Se retorna una confirmación al usuario.  
- **Flujo Alternativo:**  
  - Si el recurso no existe o ocurre un error durante la actualización, se retorna un error y se revierte la operación.

---

### BLINK-6: Eliminación de Archivos o Directorios

- **Identificador:** BLINK-6  
- **Nombre:** Eliminación de Archivos o Directorios  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación, identificador del archivo o directorio a eliminar.  
- **Salida:** Confirmación de eliminación del recurso.  
- **Descripción:**  
  El sistema debe permitir a los usuarios eliminar archivos o directorios, removiendo la información de la base de datos (a través de la API REST) y eliminando los archivos físicos de los nodos de almacenamiento mediante gRPC.  
- **Precondiciones:** Usuario autenticado, existencia del recurso y permisos adecuados.  
- **Flujo Básico:**  
  1. El usuario envía una solicitud SOAP para eliminar un recurso, proporcionando el token y el ID correspondiente.  
  2. El servidor valida el token, verifica la existencia y permisos del recurso.  
  3. Se elimina el registro en la base de datos y se notifica a los nodos de almacenamiento para eliminar el archivo.  
  4. Se retorna una confirmación de eliminación.  
- **Flujo Alternativo:**  
  - Si el recurso no se encuentra o falla la eliminación en alguno de los nodos, se retorna un error y se procede a un rollback de la operación.

---

### BLINK-7: Compartir Archivos o Directorios

- **Identificador:** BLINK-7  
- **Nombre:** Compartir Archivos o Directorios  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación, identificador del recurso, lista de identificadores de usuarios destinatarios.  
- **Salida:** Confirmación de compartición y actualización de permisos.  
- **Descripción:**  
  El sistema debe permitir a los usuarios compartir archivos o directorios con otros usuarios, actualizando los permisos en la base de datos mediante la API REST.  
- **Precondiciones:** Usuario autenticado, existencia del recurso y validez de los usuarios destinatarios.  
- **Flujo Básico:**  
  1. El usuario envía una solicitud SOAP con el token, el ID del recurso y la lista de usuarios con los que se compartirá.  
  2. El servidor valida el token, la existencia del recurso y de los usuarios destinatarios.  
  3. Se actualizan los permisos correspondientes en la base de datos a través de la API REST.  
  4. Se retorna una confirmación de la acción.  
- **Flujo Alternativo:**  
  - Si el recurso o alguno de los usuarios no existe, se retorna un error de validación.

---

### BLINK-8: Reporte de Consumo de Espacio

- **Identificador:** BLINK-8  
- **Nombre:** Reporte de Consumo de Espacio  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Token de autenticación.  
- **Salida:** Árbol estructurado que representa el consumo de espacio por directorios y archivos.  
- **Descripción:**  
  El sistema debe generar un reporte visual en forma de árbol que detalle el consumo de espacio en almacenamiento, consultando la información almacenada en la base de datos mediante la API REST.  
- **Precondiciones:** Usuario autenticado y existencia de datos de almacenamiento en la base de datos.  
- **Flujo Básico:**  
  1. El usuario solicita el reporte enviando el token a través del servicio SOAP.  
  2. El servidor valida el token y recupera la información de consumo desde la base de datos.  
  3. Se genera y retorna la representación en árbol del consumo de espacio.  
- **Flujo Alternativo:**  
  - Si ocurre un error en la consulta o el token es inválido, se retorna un mensaje de error.

---

## Requerimientos No Funcionales

### BLINK-9: Rendimiento del Sistema

- **Identificador:** BLINK-9  
- **Nombre:** Rendimiento del Sistema  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Solicitudes concurrentes de operaciones del sistema.  
- **Salida:** Respuestas procesadas dentro de tiempos definidos (por ejemplo, < 500 ms en carga máxima).  
- **Descripción:**  
  El sistema debe ser capaz de manejar un alto volumen de solicitudes concurrentes, manteniendo tiempos de respuesta óptimos incluso bajo cargas elevadas.  
- **Precondiciones:** Sistema desplegado en ambiente de pruebas de rendimiento con cargas simuladas.  
- **Flujo Básico:**  
  1. Se simulan múltiples solicitudes concurrentes al sistema.  
  2. El sistema procesa las solicitudes manteniendo el rendimiento estipulado.  
- **Flujo Alternativo:**  
  - Si se detecta una degradación en el rendimiento, se activan mecanismos de escalado y se notifica al equipo de operaciones para análisis y ajuste.

---

### BLINK-10: Escalabilidad Horizontal

- **Identificador:** BLINK-10  
- **Nombre:** Escalabilidad Horizontal  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Incremento en la carga de usuarios y operaciones.  
- **Salida:** Integración de nuevos nodos de almacenamiento y servidores sin interrupción del servicio.  
- **Descripción:**  
  La arquitectura debe permitir la adición de nuevos nodos y servidores de forma dinámica para distribuir la carga y mantener el rendimiento del sistema.  
- **Precondiciones:** Disponibilidad de hardware adicional y configuraciones de red apropiadas.  
- **Flujo Básico:**  
  1. Se detecta un aumento en la carga del sistema.  
  2. Se incorporan nuevos nodos o instancias de servidores al clúster de forma automática o mediante configuración manual.  
- **Flujo Alternativo:**  
  - En caso de falla en la incorporación de nuevos nodos, se activa un protocolo de recuperación y se notifica al administrador.

---

### BLINK-11: Disponibilidad y Tolerancia a Fallos

- **Identificador:** BLINK-11  
- **Nombre:** Disponibilidad y Tolerancia a Fallos  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Fallos en uno o más componentes (nodos, servidores de aplicación, etc.).  
- **Salida:** Servicio continuo con disponibilidad mínima del 99.9%.  
- **Descripción:**  
  El sistema debe garantizar la continuidad del servicio mediante redundancia y mecanismos de failover, de modo que la falla de componentes individuales no interrumpa la operatividad global.  
- **Precondiciones:** Implementación de redundancia, balanceo de carga y monitoreo activo.  
- **Flujo Básico:**  
  1. Se produce la falla de un componente.  
  2. El sistema redirige automáticamente las solicitudes a componentes redundantes sin afectar el servicio.  
- **Flujo Alternativo:**  
  - Si la falla afecta a múltiples componentes, se activa un protocolo de contingencia y se notifica al equipo de operaciones para una intervención inmediata.

---

### BLINK-12: Seguridad en las Comunicaciones

- **Identificador:** BLINK-12  
- **Nombre:** Seguridad en las Comunicaciones  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Solicitudes y respuestas de datos entre clientes y componentes internos.  
- **Salida:** Datos cifrados y autenticados en todas las transmisiones.  
- **Descripción:**  
  Todas las comunicaciones entre clientes y servidores (SOAP, RMI, REST, gRPC) deben realizarse a través de canales seguros (TLS/HTTPS) y utilizar mecanismos de autenticación robustos, protegiendo la integridad y confidencialidad de la información.  
- **Precondiciones:** Certificados digitales válidos y configuraciones de cifrado implementadas en cada componente.  
- **Flujo Básico:**  
  1. Se establece una conexión segura utilizando TLS/HTTPS.  
  2. Se autentican las comunicaciones y se cifran los datos en tránsito.  
- **Flujo Alternativo:**  
  - Si se detecta algún fallo en la seguridad (por ejemplo, certificados expirados o vulnerabilidades en el cifrado), se bloquea la conexión y se notifica al equipo de seguridad para una acción correctiva.

---

### BLINK-13: Compatibilidad e Integración Tecnológica

- **Identificador:** BLINK-13  
- **Nombre:** Compatibilidad e Integración Tecnológica  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Interacción entre protocolos y tecnologías diversas (SOAP, RMI, REST, gRPC).  
- **Salida:** Comunicación fluida e integración sin errores entre los diferentes componentes.  
- **Descripción:**  
  El sistema debe asegurar la interoperabilidad entre las distintas tecnologías utilizadas, garantizando que la integración entre el servidor de autenticación (con MariaDB) y el servidor de base de datos (con PostgreSQL) se realice sin problemas y conforme a los estándares definidos.  
- **Precondiciones:** Interfaces y endpoints claramente definidos y documentados.  
- **Flujo Básico:**  
  1. Se establecen las conexiones entre los distintos servicios mediante sus protocolos respectivos.  
  2. La transferencia de datos se efectúa correctamente entre componentes.  
- **Flujo Alternativo:**  
  - En caso de incompatibilidades, se activan adaptadores o middleware para resolver las discrepancias, y se genera un log del error para su análisis.

---

### BLINK-14: Mantenibilidad y Documentación

- **Identificador:** BLINK-14  
- **Nombre:** Mantenibilidad y Documentación  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Solicitudes de cambios o actualizaciones en el sistema.  
- **Salida:** Código modular, bien estructurado y documentado.  
- **Descripción:**  
  La solución debe estar diseñada de forma modular, siguiendo buenas prácticas de ingeniería de software, y contar con documentación actualizada que facilite futuras modificaciones y el mantenimiento del sistema.  
- **Precondiciones:** Existencia de estándares y políticas de codificación y documentación dentro del equipo de desarrollo.  
- **Flujo Básico:**  
  1. Se implementa una actualización o modificación en un módulo específico.  
  2. Se mantiene la integridad del sistema sin afectar otros módulos y se actualiza la documentación correspondiente.  
- **Flujo Alternativo:**  
  - Si se detectan dependencias o acoplamientos excesivos, se planifica una refactorización y se actualizan las directrices de desarrollo para evitar recurrencias.

---

### BLINK-15: Monitoreo y Logging

- **Identificador:** BLINK-15  
- **Nombre:** Monitoreo y Logging  
- **Prioridad:** Media  
- **Requerimiento Asociado:** —  
- **Entrada:** Actividades y eventos generados por el sistema.  
- **Salida:** Registros detallados (logs) y alertas en tiempo real ante incidencias.  
- **Descripción:**  
  El sistema debe implementar una solución de monitoreo centralizado que registre todas las operaciones y eventos, facilitando la detección temprana de anomalías y la generación de alertas para acciones correctivas.  
- **Precondiciones:** Implementación de una infraestructura de logging y monitoreo (por ejemplo, ELK Stack, Prometheus, etc.).  
- **Flujo Básico:**  
  1. Se registran todas las operaciones y eventos críticos en el sistema.  
  2. El sistema analiza los logs y, en caso de detectar anomalías, genera alertas en tiempo real.  
- **Flujo Alternativo:**  
  - Si falla el sistema de logging o monitoreo, se activa un protocolo de respaldo y se notifica al equipo de operaciones para su revisión inmediata.

---

### BLINK-16: Replicación de Base de Datos

- **Identificador:** BLINK-16  
- **Nombre:** Replicación de Base de Datos  
- **Prioridad:** Alta  
- **Requerimiento Asociado:** —  
- **Entrada:** Eventos de escritura en la base de datos de los servidores (MariaDB para autenticación y PostgreSQL para base de datos).  
- **Salida:** Sincronización de datos entre nodos y disponibilidad garantizada en caso de fallos.  
- **Descripción:**  
  El sistema debe implementar mecanismos de replicación de la base de datos para asegurar la consistencia y alta disponibilidad en ambos servidores.  
- **Precondiciones:** Configuración de replicación en los servidores de base de datos.  
- **Flujo Básico:**  
  1. Cada operación de escritura se replica automáticamente a un nodo secundario.  
  2. En caso de fallo, el sistema cambia a la réplica sin pérdida de datos.  
- **Flujo Alternativo:**  
  - Si la replicación falla, se notifica al equipo de operaciones para intervenir y restaurar la consistencia.
