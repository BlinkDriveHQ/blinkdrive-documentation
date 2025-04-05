# Historias de Usuario

Este documento recoge las historias de usuario correspondientes a la comunicación entre componentes, configuraciones de proyectos y operaciones (métodos) del sistema.

---

## Grupo 1: Historias de Comunicación entre Componentes

### HU-Comm-1: Comunicación entre Servidor Auth y Servidor App
**Perfil**: Como desarrollador  
**Quiero**: que el Servidor de Aplicación reciba un mensaje XML desde el Servidor de Autenticación  
**Para**: verificar la versión del lenguaje de programación implementada en el Servidor Auth

**Descripción**:  
Al iniciar la comunicación RMI entre el Servidor Auth y el Servidor App, el mensaje XML recibido en el Servidor App debe incluir la versión del lenguaje de programación (por ejemplo, "Java 11").

**Criterios de Aceptación**:
```xml
<respuesta>
  <version>java 11</version>
</respuesta>
```

### HU-Comm-2: Comunicación entre Servidor Nodos y Servidor App

**Perfil**: Como desarrollador  
**Quiero**: que el Servidor de Aplicación reciba un mensaje XML desde los Nodos de Almacenamiento  
**Para**: verificar la versión del lenguaje de programación implementada en el módulo de Nodos

**Descripción**:  
Durante la interacción vía gRPC, el Servidor de Aplicación debe poder visualizar un mensaje XML que indique la versión del lenguaje del servicio de Nodos.

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <version>nodejs 14</version> </respuesta>` 

----------

### HU-Comm-3: Comunicación entre Servidor BD y Servidor App

**Perfil**: Como desarrollador  
**Quiero**: que el Servidor de Aplicación reciba un mensaje XML desde el Servidor de Base de Datos  
**Para**: verificar la versión del lenguaje de programación utilizada en el módulo BD

**Descripción**:  
A través de la API REST, el Servidor de Aplicación debe recibir un mensaje XML que contenga la versión del lenguaje implementado en el Servidor BD.

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <version>java 11</version> </respuesta>` 

----------

### HU-Comm-4: Comunicación entre Servidor App y Backend

**Perfil**: Como desarrollador  
**Quiero**: que el Servidor de Aplicación reciba un mensaje XML desde el Backend  
**Para**: verificar la versión del lenguaje de programación implementada en el Backend

**Descripción**:  
La comunicación interna entre el Servidor de Aplicación y el Backend debe incluir un mensaje XML con la versión del lenguaje usado en el Backend.

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <version>java 11</version> </respuesta>` 

----------

### HU-Comm-5: Comunicación entre Servidor Frontend y Backend

**Perfil**: Como desarrollador  
**Quiero**: que el Backend exponga la versión del lenguaje de programación en una respuesta visible desde el Frontend  
**Para**: verificar la configuración del Backend (en esta comunicación se utiliza JSON, a diferencia de las demás)

**Descripción**:  
Al realizar una petición desde el Frontend al Backend, la respuesta debe ser en formato JSON e incluir la versión del lenguaje implementado en el Backend.

**Criterios de Aceptación**:

json

CopiarEditar

`{  "version":  "javascript ES6"  }` 

----------

## Grupo 2: Historias de Configuración de Proyectos

El criterio de aceptación para cada historia es visualizar, al realizar una petición, la versión del lenguaje de programación utilizada en ese servicio.

### HU-Config-1: Configuración del Frontend

**Perfil**: Como desarrollador Frontend  
**Quiero**: que al realizar una petición al servicio del Frontend se muestre la versión del lenguaje  
**Para**: confirmar que el Frontend está correctamente configurado

**Criterios de Aceptación**:

json

CopiarEditar

`{  "frontendVersion":  "typescript 4.5"  }` 

----------

### HU-Config-2: Configuración del Backend

**Perfil**: Como desarrollador Backend  
**Quiero**: que al realizar una petición al servicio del Backend se muestre la versión del lenguaje  
**Para**: confirmar que el Backend está correctamente configurado

**Criterios de Aceptación**:

json

CopiarEditar

`{  "backendVersion":  "java 11"  }` 

----------

### HU-Config-3: Configuración del Servidor de Aplicación (App)

**Perfil**: Como desarrollador  
**Quiero**: que al realizar una petición al Servidor de Aplicación se muestre la versión del lenguaje  
**Para**: confirmar que el Servidor de Aplicación está correctamente configurado

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <appVersion>java 11</appVersion> </respuesta>` 

----------

### HU-Config-4: Configuración del Servidor de Base de Datos (BD)

**Perfil**: Como desarrollador  
**Quiero**: que al realizar una petición al Servidor de Base de Datos se muestre la versión del lenguaje  
**Para**: confirmar que el Servidor BD está correctamente configurado

**Criterios de Aceptación**:

json

CopiarEditar

`{  "bdVersion":  "java 11"  }` 

----------

### HU-Config-5: Configuración del Servidor de Autenticación (Auth)

**Perfil**: Como desarrollador  
**Quiero**: que al realizar una petición al Servidor de Autenticación se muestre la versión del lenguaje  
**Para**: confirmar que el módulo de autenticación está correctamente configurado

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <authVersion>java 11</authVersion> </respuesta>` 

----------

### HU-Config-6: Configuración de los Nodos de Almacenamiento

**Perfil**: Como desarrollador  
**Quiero**: que al realizar una petición a los Nodos de Almacenamiento se muestre la versión del lenguaje  
**Para**: confirmar que los Nodos están correctamente configurados

**Criterios de Aceptación**:

json

CopiarEditar

`{  "nodosVersion":  "nodejs 14"  }` 

----------

## Grupo 3: Historias por Método

Cada historia a continuación corresponde a un método específico del sistema.

### Operaciones de Archivos

#### HU-File-1: Subir Archivo

**Perfil**: Como usuario  
**Quiero**: subir un archivo especificando mi usuario, el directorio destino y el archivo  
**Para**: almacenar mi archivo en el sistema

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>subirArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-File-2: Descargar Archivo

**Perfil**: Como usuario  
**Quiero**: descargar un archivo especificando mi usuario y el identificador del archivo  
**Para**: acceder al contenido del archivo

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>descargarArchivo</operacion> <resultado>contenido del archivo</resultado> </respuesta>` 

----------

#### HU-File-3: Eliminar Archivo

**Perfil**: Como usuario  
**Quiero**: eliminar un archivo especificando mi usuario y el identificador del archivo  
**Para**: remover contenido que ya no necesito

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>eliminarArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-File-4: Mover Archivo

**Perfil**: Como usuario  
**Quiero**: mover un archivo a otro directorio  
**Para**: organizar mejor mi contenido

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>moverArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-File-5: Compartir Archivo

**Perfil**: Como usuario  
**Quiero**: compartir un archivo con otro usuario  
**Para**: colaborar y permitir acceso a mi contenido

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>compartirArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-File-6: Obtener Metadatos de Archivo

**Perfil**: Como usuario  
**Quiero**: consultar los metadatos de un archivo  
**Para**: conocer detalles como nombre, tamaño y fecha de creación

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>obtenerMetadatosArchivo</operacion> <resultado>metadatos</resultado> </respuesta>` 

----------

### Operaciones de Directorios

#### HU-Dir-1: Crear Directorio

**Perfil**: Como usuario  
**Quiero**: crear un directorio (o subdirectorio) proporcionando mi usuario, el nombre y (opcionalmente) el directorio padre  
**Para**: organizar mis archivos en una estructura jerárquica

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>crearDirectorio</operacion> <resultado>idDelDirectorio</resultado> </respuesta>` 

----------

#### HU-Dir-2: Eliminar Directorio

**Perfil**: Como usuario  
**Quiero**: eliminar un directorio especificando mi usuario y el identificador del directorio  
**Para**: limpiar mi espacio de almacenamiento

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>eliminarDirectorio</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Dir-3: Mover Directorio

**Perfil**: Como usuario  
**Quiero**: mover un directorio a otro directorio padre  
**Para**: reorganizar mi estructura de archivos

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>moverDirectorio</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Dir-4: Compartir Directorio

**Perfil**: Como usuario  
**Quiero**: compartir un directorio con otro usuario  
**Para**: permitir el acceso a mi contenido organizado en directorios

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>compartirDirectorio</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Dir-5: Listar Archivos en Directorio

**Perfil**: Como usuario  
**Quiero**: listar todos los archivos contenidos en un directorio  
**Para**: visualizar mi contenido organizado

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>listarArchivosEnDirectorio</operacion> <resultado>listaDeArchivos</resultado> </respuesta>` 

----------

### Operaciones de Autenticación

#### HU-Auth-1: Registrar Usuario

**Perfil**: Como nuevo usuario  
**Quiero**: registrarme proporcionando email y password  
**Para**: poder acceder al sistema

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>registrarUsuario</operacion> <resultado>idUsuario</resultado> </respuesta>` 

----------

#### HU-Auth-2: Iniciar Sesión

**Perfil**: Como usuario  
**Quiero**: iniciar sesión con mi email y password  
**Para**: obtener un token de autenticación

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>iniciarSesion</operacion> <resultado>tokenValido</resultado> </respuesta>` 

----------

#### HU-Auth-3: Validar Token

**Perfil**: Como sistema  
**Quiero**: validar un token recibido en cada solicitud  
**Para**: asegurar que solo usuarios autenticados accedan a los servicios

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>validarToken</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Auth-4: Cerrar Sesión

**Perfil**: Como usuario  
**Quiero**: cerrar mi sesión de forma segura  
**Para**: invalidar mi token y proteger mi cuenta

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>cerrarSesion</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Auth-5: Recuperar Contraseña

**Perfil**: Como usuario  
**Quiero**: recuperar mi contraseña proporcionando mi email  
**Para**: restablecer mi acceso en caso de olvido

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>recuperarContrasena</operacion> <resultado>true</resultado> </respuesta>` 

----------

### Operaciones de Reportes

#### HU-Report-1: Obtener Uso de Espacio

**Perfil**: Como usuario  
**Quiero**: consultar el uso de espacio de mis archivos  
**Para**: administrar y optimizar mi almacenamiento

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>obtenerUsoEspacio</operacion> <resultado>datosUso</resultado> </respuesta>` 

----------

#### HU-Report-2: Obtener Historial de Acciones

**Perfil**: Como usuario  
**Quiero**: visualizar el historial de acciones realizadas en mi cuenta  
**Para**: tener un registro de mis actividades

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>obtenerHistorialAcciones</operacion> <resultado>listaAcciones</resultado> </respuesta>` 

----------

### Operaciones de Nodos de Almacenamiento

#### HU-Storage-1: Almacenar Archivo en Nodo

**Perfil**: Como usuario  
**Quiero**: que mi archivo se almacene en el nodo de almacenamiento  
**Para**: asegurar que mi contenido se guarde de forma redundante

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>almacenarArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Storage-2: Recuperar Archivo desde Nodo

**Perfil**: Como usuario  
**Quiero**: recuperar un archivo almacenado en el nodo  
**Para**: poder visualizar o descargar mi contenido

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>recuperarArchivo</operacion> <resultado>contenidoArchivo</resultado> </respuesta>` 

----------

#### HU-Storage-3: Eliminar Archivo en Nodo

**Perfil**: Como usuario  
**Quiero**: eliminar un archivo del nodo de almacenamiento  
**Para**: gestionar mi espacio y remover contenido innecesario

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>eliminarArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Storage-4: Mover Archivo en Nodo

**Perfil**: Como usuario  
**Quiero**: mover un archivo a otro directorio dentro del nodo  
**Para**: organizar mis archivos de forma óptima

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>moverArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Storage-5: Verificar Integridad del Archivo

**Perfil**: Como usuario  
**Quiero**: verificar que el archivo almacenado esté íntegro  
**Para**: asegurar que la copia no se haya corrompido

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>verificarIntegridadArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Storage-6: Replicar Archivo a Otro Nodo

**Perfil**: Como usuario  
**Quiero**: replicar un archivo a otro nodo para redundancia  
**Para**: mejorar la tolerancia a fallos del sistema

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>replicarArchivo</operacion> <resultado>true</resultado> </respuesta>` 

----------

#### HU-Storage-7: Obtener Estado del Nodo

**Perfil**: Como administrador  
**Quiero**: consultar el estado del nodo de almacenamiento  
**Para**: monitorear su disponibilidad y rendimiento

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>obtenerEstadoNodo</operacion> <resultado>estadoActual</resultado> </respuesta>` 

----------

#### HU-Storage-8: Sincronizar Nodo

**Perfil**: Como administrador  
**Quiero**: sincronizar el nodo de almacenamiento con el sistema  
**Para**: asegurar que la información esté actualizada y replicada correctamente

**Criterios de Aceptación**:

xml

CopiarEditar

`<respuesta> <operacion>sincronizarNodo</operacion> <resultado>true</resultado> </respuesta>`