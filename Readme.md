# Marvel-challenge


Este proyecto fue propuesto en una entrevista laboral con el objetivo de demostrar conocimientos para cubrir una vacante como IOS Developer.
A continuación adjunto detalles del challenge e info permitente.

-

### Aspectos técnicos a evaluar: iOS
#### Requerimientos mínimos
Lenguaje: Swift 5.
Integración de PODS (Firebase, Alamofire, etc.) 

Manejo de Patrones:

 - MVC o MVVM o VIPER 
 - Singleton  

UI:

- Storyboards + constraints
- XIB (deseable)

Conceptos:

- UserDefault o Keychain o base de datos local (como Realm)
- Dispatch background
- NavigationController + envío de parámetros entre VC
- Reusable Cell
- Optional & Guard
- Custom Protocols & delegates

Funciones avanzadas (si aplica):

- Map, Filter & Reduce (deseable)

General: 

- Organización del proyecto en Group
- Alertas y Manejo de errores de APIS

### Otros aspectos a evaluar

Prolijidad en el código
Cumplimiento de todos los requerimientos establecidos en el Challenge Grado de cumplimiento del diseño gráfico (UI)
Manejo de estructuras y tipos de datos correctos

### Descripción del Challenge

Descripción general
Los fanáticos de los cómics están ansiosos por ver los avances en la nueva app de Marvel y poder así obtener información actualizada de sus personajes favoritos. ¿Te parece que podes ser parte de esta app?

En este challenge lo que esperamos es que puedas hacer una aplicación que funcione en dispositivos iOS usando el lenguaje Swift con la temática de superhéroes de Marvel. Tendrás que obtener la información de una API que te proveemos y respetar el diseño propuesto lo más fielmente que puedas.


### Requerimientos

La aplicación que tenés que desarrollar debe constar de las siguientes secciones:

__Autenticación:__ Se debe integrar Firebase para realizar el registro/ingreso a través de Correo electrónico/contraseña como método de Sign-In (sólo esa vía). La sesión, una vez que el usuario entra, debe ser guardada para que una próxima vez no sea necesario autenticarse. Un usuario con credenciales debe ser redirigido a Pantalla Principal. Aclaración: se puede reutilizar la interfaz que provee Firebase para la autenticación, no es necesario proveer una custom UI.

__Pantalla principal:__ esta pantalla consta de un TabBar en la parte inferior, de la que se puede seleccionar entre:

- __Personajes:__ Listado de personajes de Marvel, con un paginado (estilo scroll infinito) de 15 elementos (es decir, se cargan 15, y al llegar al fondo del scroll, se cargan 15 más, y así). Al hacer tap en un elemento, se abre la pantalla Detalle del Personaje.
- __Eventos:__ Listado de eventos futuros, con un límite de 25 elementos y ordenados por fecha de comienzo de manera ascendente. Al hacer tap en uno de los eventos se abre un Modal que muestra el listado de comics a discutir.
- __Logout:__ se debe agregar una opción para cerrar sesión y volver la pantalla de login. Esta opción puede estar en un nuevo tab, como botón flotante en un tab existente o como opción en el header.
- __Detalle del Personaje:__ Información del personaje (foto, nombre, descripción). También se debe mostrar listado de cómics en los que figura.


### Diseño gráfico (UI)

Parte del objetivo de este Challenge es poder evaluar tus habilidades para respetar las pantallas y lineamientos de diseño tal como las plantean los equipos de UX / UI. Por eso es que te proveemos las pantallas que esperamos que puedas desarrollar. 
Podés acceder a las mismas desde el siguiente [enlace](https://xd.adobe.com/view/28d32f5a-e451-4565-9e4e-7c388ebc100a-7d80/). Tené en cuenta que no te mostramos la pantalla de autenticación ya que te permitimos usar la UI que te provee [Firebase](https://firebase.google.com/docs/auth/ios/firebaseui) directamente.
También contempla que necesitarás manejar imágenes que obtienes del servidor, y las mismas se deben ver con la relación de aspecto adecuada, no deben quedar márgenes sin imágenes ni estiradas para ninguna dirección.


### Datos útiles
API: [https://developer.marvel.com/docs#!/](https://developer.marvel.com/docs#!/)

Los GETs de la API tienen que llevar 3 parámetros

- apikey la public key que te dan al registrarte y solicitarla
- ts timestamp (se puede usar 1, porque no se chequea)
- hash generada a partir de un md5 = timestamp + private_key + public_key

Se puede usar esta de ejemplo

__Public Key:__ 3a783b25c80e1c44875356dd363f272d

__Private Key:__ aa1141953df8c088f39a97de10008578e834580f 

Ejemplo de llamado:

https://gateway.marvel.com/v1/public/comics?apikey=3a783b25c80e1c44875356dd363f272 d&hash=51a3ecf2f92a23817992a2663183325e&ts=1
