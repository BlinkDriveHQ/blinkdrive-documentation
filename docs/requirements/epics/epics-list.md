# Épicas del Proyecto

## Épica 1: Gestión de Autenticación y Seguridad

**Perfil**: Como **usuario/administrador**  
**Quiero**: gestionar de forma segura el acceso al sistema  
**Para**: proteger la información y los recursos ante accesos no autorizados  

**Descripción**:  
Esta épica abarca todas las funcionalidades relacionadas con el inicio de sesión, validación de credenciales, emisión de tokens y control de acceso a los recursos del sistema. Incluye la comunicación RMI con el servidor de autenticación, la implementación de protocolos seguros (HTTPS/TLS) y la verificación de permisos.

**Criterios de Aceptación**:  

- La autenticación debe validar credenciales contra el servidor de autenticación vía RMI.  
- El sistema debe emitir tokens válidos con una expiración definida.  
- Toda la comunicación debe realizarse bajo canales cifrados (HTTPS/TLS).  
- Debe existir un mecanismo para revocar o invalidar tokens comprometidos.

---

## Épica 2: Gestión de Directorios

**Perfil**: Como **usuario**  
**Quiero**: organizar mis archivos en directorios y subdirectorios  
**Para**: estructurar mi información de forma jerárquica y ordenada  

**Descripción**:  
Esta épica cubre la creación, consulta y administración de directorios y subdirectorios dentro del sistema. Implica la definición de la estructura jerárquica, el registro de metadatos en la base de datos (vía API REST) y el mantenimiento de la relación entre carpetas padre e hijo.

**Criterios de Aceptación**:  

- Permitir la creación y renombrado de directorios o subdirectorios.  
- Registrar y actualizar los directorios en la base de datos de manera consistente.  
- Validar la existencia y permisos del directorio padre antes de crear subdirectorios.  
- Manejar errores cuando el usuario no tenga permisos o el directorio no exista.

---

## Épica 3: Gestión de Archivos

**Perfil**: Como **usuario**  
**Quiero**: subir, almacenar y descargar archivos en un sistema distribuido  
**Para**: contar con un repositorio seguro y accesible desde múltiples dispositivos  

**Descripción**:  
En esta épica se contemplan las operaciones de carga y descarga de archivos mediante servicios SOAP, la distribución de archivos a través de gRPC en los nodos de almacenamiento y el registro de metadatos en la base de datos. También incluye la creación de copias redundantes en al menos dos nodos.

**Criterios de Aceptación**:  

- Subir uno o más archivos junto con sus metadatos.  
- Registrar la información del archivo (nombre, tamaño, hash, etc.) en la base de datos.  
- Descargar archivos asegurando la recuperación desde los nodos de forma redundante.  
- Manejar errores y reintentos en caso de fallas en la comunicación con nodos.

---

## Épica 4: Operaciones de Movimiento y Eliminación

**Perfil**: Como **usuario**  
**Quiero**: mover, renombrar o eliminar mis archivos y directorios  
**Para**: mantener mi información actualizada y eliminar contenido innecesario  

**Descripción**:  
Esta épica incluye la posibilidad de reubicar archivos y directorios, así como la eliminación de los mismos en el sistema distribuido. Abarca la actualización de la información en la base de datos, la notificación a los nodos para eliminar o desplazar archivos y la validación de permisos.

**Criterios de Aceptación**:  

- Permitir mover y renombrar archivos o directorios verificando la existencia del recurso.  
- Actualizar la información en la base de datos y en los nodos de almacenamiento.  
- Eliminar archivos y directorios de forma segura, incluyendo sus copias redundantes.  
- Manejar errores si no existen permisos o si algún nodo falla en la operación.

---

## Épica 5: Compartición de Archivos y Directorios

**Perfil**: Como **usuario**  
**Quiero**: compartir archivos y directorios con otros usuarios  
**Para**: colaborar y permitir el acceso a recursos de forma controlada  

**Descripción**:  
Esta épica se enfoca en la funcionalidad de compartir archivos y directorios con múltiples usuarios, actualizando los permisos en la base de datos para habilitar lecturas y/o modificaciones según corresponda.

**Criterios de Aceptación**:  

- Asignar permisos específicos (lectura, escritura, etc.) a otros usuarios.  
- Validar que los usuarios destinatarios existan en el sistema.  
- Reflejar los cambios de permisos de manera inmediata en la base de datos.  
- Retornar errores adecuados si el recurso no existe o si el usuario no tiene privilegios.

---

## Épica 6: Reporte de Consumo de Espacio

**Perfil**: Como **usuario**  
**Quiero**: visualizar un reporte del espacio ocupado por mis archivos y directorios  
**Para**: administrar y optimizar el uso de mi almacenamiento disponible  

**Descripción**:  
Esta épica describe la generación de un reporte en forma de árbol que muestre el consumo de espacio por cada directorio y archivo. Incluye la consulta de metadatos en la base de datos y la presentación consolidada de la información.

**Criterios de Aceptación**:  

- Mostrar un árbol que refleje la jerarquía de directorios y archivos.  
- Indicar el tamaño total de cada directorio y sus subdirectorios.  
- Calcular correctamente el espacio ocupado incluso con copias redundantes.  
- Manejar errores de consulta o token inválido de forma clara.

---

## Épica 7: Integración y Comunicación entre Servicios

**Perfil**: Como **equipo de desarrollo**  
**Quiero**: asegurar que todos los componentes del sistema (SOAP, RMI, REST, gRPC) funcionen de manera fluida  
**Para**: garantizar una experiencia confiable y sin interrupciones para el usuario  

**Descripción**:  
Esta épica agrupa las tareas relacionadas con la interoperabilidad de los distintos protocolos y tecnologías, asegurando la compatibilidad entre el servidor de autenticación (MariaDB), el servidor de base de datos (PostgreSQL), el servidor de aplicación y los nodos de almacenamiento.

**Criterios de Aceptación**:  

- Lograr una comunicación estable entre los servicios SOAP, RMI, REST y gRPC.  
- Manejar adaptadores o middleware en caso de incompatibilidades.  
- Documentar los endpoints y protocolos para facilitar el mantenimiento.  
- Notificar errores de integración y registrar logs para su análisis.

---

## Épica 8: Escalabilidad y Redundancia del Sistema

**Perfil**: Como **administrador del sistema**  
**Quiero**: añadir más nodos de almacenamiento y replicar la base de datos  
**Para**: garantizar alta disponibilidad, tolerancia a fallos y un servicio ininterrumpido  

**Descripción**:  
Esta épica abarca la capacidad del sistema para escalar horizontalmente, agregando nodos de almacenamiento según sea necesario, y la configuración de replicación en las bases de datos (MariaDB y PostgreSQL). De esta forma, se asegura la continuidad del servicio incluso ante fallos de componentes.

**Criterios de Aceptación**:  

- Agregar o quitar nodos sin interrumpir el servicio.  
- Configurar replicación de base de datos para alta disponibilidad.  
- Mantener la integridad de los datos ante caídas parciales de nodos o servidores.  
- Registrar y monitorear la sincronización de datos en tiempo real.

---
