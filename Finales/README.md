<h1 align='center'>Finales</h1>


## Imperativo

1. **La municipalidad de la ciudad de La Plata necesita un sistema que le permita recolectar las denuncias realizadas por los ciudadanos.**

    La denuncia la hace cualquier ciudadano y al hacerlo debe proporcionar la categoría de denuncia (1: corte de luz en la vía pública; 2: auto mal estacionado; 3: recolección de residuos; 4: ruidos molestos; 5: semáforo en malfuncionamiento; 6: bache en la calle), su DNI, la dirección (número de calle y número de altura) y el mes, día y hora. 
    
    Implemente en pascal:</br>
    a. Un módulo que genere el alta de todas las denuncias almacenando toda la información en una estructura agrupada por categoría y ordenada por número de calle. La carga finaliza hasta leer el DNI igual a cero. 
    
    b. Un módulo que reciba la estructura generada en a) y devuelva una lista de denuncias donde para cada número de calle se contabilice cantidad de denuncias totales y cantidad de denuncias realizadas en el mes de julio. 

    c. Un módulo recursivo que reciba la estructura generada en b) y devuelva el número de calle con mayor cantidad de denuncias totales.

2. **La oficina de presupuesto nacional está analizando las partidas de dinero enviadas a las 24 provincias en los últimos años.**

    a. Realice un módulo que lea la información de las partidas de dinero y las almacene en una estructura de datos eficiente para la búsqueda por año. De cada partida se lee el mes y año, código de provincia (entre 1 y 24) y monto enviado a dicha provincia en ese mes y año. La información, para cada año, debe quedar almacenada de manera ordenada ascendentemente por mes. La información se ingresa sin ningún orden. La lectura finaliza cuando se lee la partida enviada a la provincia 24 en el mes 12 y año 2022. Se sugiere utilizar el módulo leerAtencion().

    b. Realice un módulo que reciba la estructura de datos generada en el inciso 1 y retorne una nueva estructura de datos que contenga, para cada provincia, la cantidad total de partidas recibidas y el monto total.

    c. Realice un módulo recursivo que reciba la estructura generada en el inciso 2 y retorne el código de la provincia con mayor cantidad de partidas recibidas.

    d. Realice un módulo que reciba la estructura de datos generada en 1, dos años y un mes, y retorne la cantidad total de partidas enviadas a las distintas provincias en el mes entre dichos años.

3. **El teatro Musicalisimo ofrece sus instalaciones para que bandas de música puedan dar sus recitales. De cada recital se conoce: el nombre de la banda, la fecha del recital, la cantidad de canciones tocadas y el monto recaudado por la venta de entradas.**

    a. Implemente un módulo que lea registros de recitales de manera sucesiva hasta que se ingrese "ZZZ" como nombre de banda. Los recitales se pueden leer en cualquier orden. Todos los recitales leídos deben almacenarse en una estructura que permita el recorrido óptimo por monto recaudado.

    b. Implemente un módulo que reciba la estructura cargada y dos valores (ej: 200 y 500) y devuelva una lista con todos los recitales cuyo monto recaudado se encuentra entre esos dos valores leídos (ambos inclusive). La lista resultante debe estar ordenada por monto de mayor a menor,

    c. Implemente un módulo recursivo que reciba la lista creada en b) y devuelva la cantidad de recitales que tocaron más de 12 canciones.

## Objetos

1. **El servicio meteorológico nacional necesita un sistema para sus estaciones que permita registrar la temperatura promedio mensual durante los últimos N años.**

     Además, según la estación, necesita dos versiones del sistema que permita o bien reportar el promedio histórico por años, o bien reportar el promedio histórico por meses. Esto se detalla más adelante.

    Todas las estaciones se caracterizan por un nombre y las coordenadas latitud y longitud donde se encuentra. Implemente las clases, constructores y métodos que considere necesario para realizar lo siguiente:

    a) Crear el sistema de registro/informes que permita almacenar la temperatura promedio de cada mes del año en los últimos N años.

    b) Registrar (almacenar) una temperatura de un mes y año recibidos por parámetro.

    c) Devolver la temperatura de un determinado mes y año recibidos por parámetro.

    d) Devolver un String que concatena el mes y año en que se registró la mayor temperatura. Nota: Suponga que ya estarán registradas las temperaturas de todos los meses y años. 
    
    e) Devolver un string con el nombre de la estación, sus coordenadas y los promedios mensuales o anuales según corresponda: 

        a. La versión del sistema que reporta por años deberá calcular el promedio para cada año (el promedio del año A se calcula usando los datos mensuales de ese año).
            Ej: "La Plata (34,921 S-57,955 O): Αño 2020: 23,8 °C; Año 2021: 26,1 °C; Αñο 2022: 25,3 °C."

        b. La versión del sistema que reporta por meses deberá calcular el promedio para cada mes (el promedio del mes M se calcula usando los datos de ese mes de todos los años).
            Ej: "La Plata (34,921 S-57,955 O): Enero: 28,2 °C; Febrero: 26,8 °C; Marzo: 24.3 °C....." Nota: Suponga que ya estarán registradas las temperaturas de todos los meses y años.

    f) Realice un programa principal que cree un Sistema con informe anual para los últimos 3 años. Cargue todas las temperaturas (para todos los meses y años). Informe los promedios anuales, y el mes y año en que se registró la mayor temperatura.

    Luego cree un Sistema con informe mensual para los últimos 4 años. Cargue todas las temperaturas (para todos los meses y años). Informe los promedios mensuales, y el mes y año en que se registró la mayor temperatura.


2. **La UNLP desea representar los diferentes subsidios (de estadias y de bienes) pedidos por sus investigadores. De todo subsidio se conoce el nombre del investigador, el nombre de su plan de trabajo y la fecha de solicitud.**

    Además de los subsidios de estadia se conoce el lugar de destino, el costo en pasajes, la cantidad de dias de estadia y el monto de hotel por dia.

    De los subsidios de bienes se guardan todos los bienes solicitados (como máximo N). De cada bien se conoce: descripción, cantidad y costo por unidad.

    a. Genere las clases. Implemente constructores para iniciar los diferentes subsidios a partir de toda la información necesaria; tenga en cuenta que los subsidios de bienes deben iniciar sin bienes y deben permitir guardar un máximo de N bienes.

    b. Implemente todos los métodos necesarios, en las clases que corresponda, para:

    -  agregar un bien a un subsidio de bienes.

    - devolver el monto total del subsidio, teniendo en cuenta las fórmulas: 
        - Monto_total_subsidio_estadia = costo_pasajes + cantidad_dias_estadia * monto_hotel_por_dia 
        - Monto_total_subsidio_bienes = ∑ costo_final_bien_i donde costo_final_bien_i = cantidad_bien_i * costo_por_unidad_bien_i

    - devolver un String que represente el subsidio, siguiendo los ejemplos:
        - Subsidio estadia: "Nombre del investigador.... Plan de trabajo:... Fecha de solicitud:
        - Lugar de destino: Dias de estadia:...."
        - Subsidio bienes: "Nombre del investigador.... Plan de trabajo:... Fecha de solicitud: Monto total
        - Descripción de los bienes solicitados: descripción bien 1, descripción bien 2...."

    c. Escriba un programa que instancie un subsidio de estadía y un subsidio de bienes, establezca todos los datos necesarios para cada uno de ellos y muestre por consola la representación String de cada uno.

    [Instanciacion de Objetos](/Finales/javas/2023-2-ProgPrincipal.java)

    [Subsidio](/Finales/javas/2023-2-Subsidio.java)

    [Subsidio de Estadia](/Finales/javas/2023-2-SubsidioDeEstadia.java)

    [Subsidio de Bien](/Finales/javas/2023-2-SubsidioDeBien.java)

    [Bien](/Finales/javas/2023-2-Bien.java)


3. **Una agencia de apuestas de partidos de fútbol desea un sistema para manejar las apuestas que realizan sus clientes, los partidos que usa para las apuestas y todo lo necesario para pagar a los clientes ganadores.**

    Se desea conocer la siguiente información. De los partidos: el nombre del local, el nombre del visitante, resultado (String con "victoria local", "empate" o "victoria visitante" -inicialmente en"") y 3 factores de pago (es decir, 3 valores double que son el factor de pago para victoria local, el factor de pago para empate y el factor de pago para victoria visitante, respectivamente). De las apuestas: el nombre y DNI del cliente, ID único de partido, la apuesta en si (String con "victoria local", "empate" o "victoria visitante") y monto apostado.

    La agencia maneja hasta 20 partidos de fútbol y hasta 100 apuestas.

    Implemente las clases del sistema con sus constructores y métodos para:

    - Agregar un nuevo partido y retornar su ID único en el sistema. El ID es un nro, entre 1 y 20.

    - Agregar una apuesta.

    - Dado el ID de un partido, ingresarle un resultado (String) a dicho partido. El ID es un nro, entre 1 y 20.

    - Cerrar apuestas, esto es: para cada apuesta acertado para el partido en cuestión, debe informar: nombre, DNI y dinero ganado.
        - Ejemplo: si apostó "empate" para el partido con ID 3, y el resultado de ese partido fue "empate", la apuesta es acertada, por lo que debe informar lo pedido. El dinero ganado en ese caso será: monto_apostado factor_de_pago_empate_del_partido.

        NOTA: Asuma que se ingresaron todos los resultados para todos los partidos cargados.

    - Limpiar el sistema de apuestas, es decir borra los partidos y apuestas del sistema para el comienzo de una nueva fecha del campeonato.

    Realice un programa para probar el correcto funcionamiento del sistema.

## Concurrente

1. Implemente el siguiente juego: Existe un área compartida delimitada por las esquinas (1,1) (20,20), dos robots jugadores y un robot fiscalizador.</br>
Ambos robots jugadores juegan simultáneamente y durante el juego tiene cinco intentos para posicionarse en una esquina del área compartida determinada al azar (elegida por el robot fiscalizador), junta todas las flores de esa esquina y vuelve a su esquina original informando al fiscalizador cuántas flores juntó en dicha esquina. Cuando los dos robots jugadores finalizan sus cinco intentos, el robot fiscalizador determinará e informará quien es el robot ganador (el que más flores juntó en total).</br>
El robot perdedor se debe posicionar en la esquina (25,25) y depositar todas las flores juntadas por él. Notas: Los robots jugadores se posicionan inicialmente en (21,21), (22,22) y el robot fiscalizador en la esquina (23,23).

