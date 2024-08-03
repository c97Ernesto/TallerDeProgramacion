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

### Final Taller de programación - Módulo imperativo 02/07/2024

La oficina de mantenimiento de una empresa recibe llamadas telefónicas con problemas reportados por distintos empleados de la empresa. En cada llamada recibe: nivel de la importancia del problema (un número entre 1 .. 5), sector de la empresa donde se detectó el problema (un número entre 1 .. 50), número de empleados afectados por el problema.

Implemente en Pascal un programa que invoque a:

1.   Un módulo que simule la recepción de 100 llamadas en total con problemas reportados (puede generar números random) y almacene toda la información generada en una estructura agrupada por nivel de importancia y ordenada por sector de la empresa donde se detectó el problema.

2. Un módulo que reciba la estructura generada en 1) y un nivel de importancia N y devuelva una estructura eficiente para la búsqueda, ordenada por número de empleados afectados, con todos los problemas del
nivel N.

3. Un módulo que reciba la estructura generada en 2) y devuelva el número de sector del problema con mayor cantidad de empleados afectados.

    ```pascal
    PROGRAM finaleImperativo_07_24;
    CONST
        MAX_llamadas = 8;
        MAX_importancias = 5;
    TYPE
        rng_importancias = 1..5;
        rng_sectores = 1..50;
        
        reg_llamada = record
            nivelImportancia: rng_importancias;
            sectorProblema: rng_sectores;
            empleadosAfectados: integer;
        end;
        
        lista_llamadas = ^nodo_lista;
        nodo_lista = record
            sig: lista_llamadas;
            datos: reg_llamada;
        end;
        
        arbol_llamadas = ^nodo;
        nodo = record
            hi: arbol_llamadas;
            hd: arbol_llamadas;
            datos: reg_llamada;
        end;
        
        vector_importancias = array [rng_importancias] of lista_llamadas;
        
    {________________________InicializarVectorListas.________________________}
    Procedure iniciarlizarVector(var vec: vector_importancias);
    Var
        i: integer;
    Begin
        for i:= 1 to MAX_importancias do begin
            vec[i]:= nil;
        end;
    End;
    {________________________Punto 1.________________________}
    Procedure GenerarVectorDeListas(var vec: vector_importancias);

        procedure leerLlamada(var llamada: reg_llamada);
        begin
            write('Ingresar nivel de importancia del problema: ');
            readln(llamada.nivelImportancia);
            write('Ingresar sector donde se detectó el problema: ');
            readln(llamada.sectorProblema);
            write('Números de empleados afectados: ');
            readln(llamada.empleadosAfectados);
        end;
        
        procedure cargarListaOrdenada(var l: lista_llamadas; llamada: reg_llamada);
        var
            ant, act, nodo: lista_llamadas;
        begin
            new(nodo);
            nodo^.datos:= llamada;
            act:= l;
            while ((act <> nil) and (llamada.sectorProblema < act^.datos.sectorProblema)) do begin
                ant:= act;
                act:= act^.sig;
            end;
            if (act = l) then
                l:= nodo
            else
                ant^.sig:= nodo;
            nodo^.sig:= act;
        end;

    Var
        i: integer;
        llamada: reg_llamada;
    Begin
        for i:= 1 to MAX_llamadas do begin
            leerLlamada(llamada);
            cargarListaOrdenada(vec[llamada.nivelImportancia], llamada);
        end;
    End;
    {________________________Punto 2.________________________}
    Procedure GenerarArbol(var arbol: arbol_llamadas; l: lista_llamadas);

        procedure insertarEnArbol(var nodo: arbol_llamadas; llamada: reg_llamada);
        begin
            if (nodo <> nil) then
                if (llamada.empleadosAfectados < nodo^.datos.empleadosAfectados) then
                    insertarEnArbol(nodo^.hi, llamada)
                else
                    insertarEnArbol(nodo^.hd, llamada)
            else begin
                new(nodo);
                nodo^.datos:= llamada;
                nodo^.hi:= nil;
                nodo^.hd:= nil;
            end;
        end;

    Begin
        arbol:= nil;
        while (l <> nil) do begin
            insertarEnArbol(arbol, l^.datos);
            l:= l^.sig;
        end;
    End;
    {________________________Punto 3.________________________}
    Function devolverMayorCantDeEmpleados(a: arbol_llamadas): integer;
    Begin
        if (a^.hd = nil) then
            devolverMayorCantDeEmpleados:= a^.datos.sectorProblema
        else
            devolverMayorCantDeEmpleados:= devolverMayorCantDeEmpleados(a^.hd);
    End;
    {________________________P.P.________________________}
    VAR
        vector: vector_importancias;
        arbol: arbol_llamadas;
        nivel: integer;
    BEGIN
        iniciarlizarVector(vector);
        writeln('');
        
        GenerarVectorDeListas(vector);
        writeln('');
        
        ImprimirVector(vector);
        writeln('');
        
        write('Ingresar Nivel de Importancia: '); readln(nivel);
        if ((nivel <= MAX_importancias) and (vector[nivel] <> nil)) then begin
            GenerarArbol(arbol, vector[nivel]);
            ImprimirArbol(arbol);
            writeln('El número de sector con mayor cantidad de empleados afectados es: ', devolverMayorCantDeEmpleados(arbol));
        end;
    END.
    ```


### Final Taller de programación - Programación Imperativa - 12/10/2023 

El teatro Musicalisimo ofrece sus instalaciones para que bandas de música puedan dar sus recitales. De cada recital se conoce: el nombre de la banda, la fecha del recital, la cantidad de canciones tocadas y el monto recaudado por la venta de entradas.
1. Implemente un módulo que lea registros de recitales de manera sucesiva hasta que se ingrese "ZZZ" como nombre de banda. Los recitales se pueden leer en cualquier orden. Todos los recitales leídos deben almacenarse en una estructura que permita el recorrido óptimo por monto recaudado.
2. Implemente un módulo que reciba la estructura cargada y dos valores (ej: 200 y 500) y devuelva una lista con todos los recitales cuyo monto recaudado se encuentra entre esos dos valores leídos (ambos inclusive). La lista resultante debe estar ordenada por monto de mayor a menor,
3. Implemente un módulo recursivo que reciba la lista creada en b) y devuelva la cantidad de recitales que tocaron más de 12 canciones.

```pascal
PROGRAM finalImperativo_10_23;
CONST
	FIN = 'ZZZ';

TYPE
	reg_recital = record
		nombreBanda: string;
		fecha: string;
		cancionesTocadas: integer;
		montoRecaudado:real;
	end;
	
	arbol = ^nodo_arbol;
	nodo_arbol = record
		datos: reg_recital;
		hi: arbol;
		hd: arbol;
	end;
	
	lista_recitales = ^nodo_lista;
	nodo_lista = record
		datos: reg_recital;
		sig: lista_recitales
	end;
	

{______________________________Punto 1______________________________}
Procedure GenerarArbol(var a: arbol);
	procedure leerRecital(var r: reg_recital; nombre: string);
	begin
		r.nombreBanda:= nombre;
		write('Ingresar fecha del recital: ');
		readln(r.fecha);
		write('Ingresar canciones tocadas: ');
		readln(r.cancionesTocadas);
		write('Ingresar monto recaudado: ');
		readln(r.montoRecaudado);
	end;

	procedure insertarNodo(var a: arbol; registro: reg_recital);
	begin
		if (a <> nil) then
			if (a^.datos.montoRecaudado > registro.montoRecaudado) then
				insertarNodo(a^.hi, registro)
			else
				insertarNodo(a^.hd, registro)
		else begin
			new(a);
			a^.datos:= registro;
			a^.hi:= nil;
			a^.hd:= nil;
		end;
	end;

Var
	recital: reg_recital;
	nombreBanda: string;
	
Begin
	a:= nil;
	
	write('Ingresar nombre de la Banda: ');
	readln(nombreBanda);
	
	while (nombreBanda <> FIN) do begin
		leerRecital(recital, nombreBanda);
		insertarNodo(a, recital);
		
		write('Ingresar nombre de la Banda <> ZZZ: ');
		readln(nombreBanda);
	end;
End;
{______________________________MostrarRecital______________________________}
Procedure MostrarRecital(recital: reg_recital);
Begin
	writeln('Nombre de Banda: ', recital.nombreBanda);
	writeln('Fecha: ', recital.fecha);
	writeln('Canciones tocadas: ', recital.cancionesTocadas);
	writeln('Monto recaudado: ', recital.montoRecaudado);
	writeln('');
End;
{______________________________ImprimirAbb______________________________}
Procedure ImprimirArbol(a: arbol);
Begin
	if (a <> nil) then begin
		ImprimirArbol(a^.hi);
		MostrarRecital(a^.datos);
		ImprimirArbol(a^.hd);
	end;
End;	
{______________________________Punto 2______________________________}
Procedure GenerarLista(a: arbol; var l: lista_recitales);
	procedure insertarNodo(var l: lista_recitales; recital: reg_recital);
	var
		nodo: lista_recitales;
	begin
		new(nodo);
		nodo^.datos:= recital;
		nodo^.sig:= l;
		l:= nodo;
	end;
	
	procedure recorrerAbb(a: arbol; n1, n2: integer; var l: lista_recitales);
	begin
		if (a <> nil) then
			if (a^.datos.montoRecaudado < n2) then
				if (a^.datos.montoRecaudado > n1) then begin
					recorrerAbb(a^.hi, n1, n2, l);
					insertarNodo(l, a^.datos);
					recorrerAbb(a^.hd, n1, n2, l);
				end
				else
					recorrerAbb(a^.hd, n1, n2, l)
			else
				recorrerAbb(a^.hi, n1, n2, l);
	end;

var
	monto1, monto2: integer;
	
Begin
	l:= nil;
	
	write('Ingresar monto 1: ');
	readln(monto1);
	write('Ingresar monto 2: ');
	readln(monto2);
	
	recorrerAbb(a, monto1, monto2, l);

End;


{______________________________ImprimirLista______________________________}
Procedure ImprimirLista(l: lista_recitales);
Begin
	if (l <> nil) then begin
		MostrarRecital(l^.datos);
		ImprimirLista(l^.sig);
	end;
End;

{______________________________Punto 3______________________________}
Procedure TotalRecitales(l: lista_recitales; var total: integer);
Begin
	while (l <> nil) do begin
		if (l^.datos.cancionesTocadas > 12) then
			total:= total + 1;
		l:= l^.sig;
	end;
End;

{______________________________P.P______________________________}
VAR
	abb: arbol;
	lista: lista_recitales;
	total: integer;
BEGIN
	
	GenerarArbol(abb);
	
	writeln('ARBOL');
	ImprimirArbol(abb);
	writeln('');
	
	GenerarLista(abb, lista);
	
	writeln('LISTA');
	ImprimirLista(lista);
	writeln('');
	
	writeln('TOTAL RECITALES');
	total:= 0;
	TotalRecitales(lista, total);
	writeln('La cantidad de recitales con más de 12 canciones tocadas fueron: ', total);
	
END.


```

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

### Final Taller de programación - Módulo POO 09/04/2024
Una compañía de seguros necesita un sistema para manejar las pólizas de sus clientes. La compañía maneja 10 seguros de rubros diferentes (0: de auto, 1: de motos, 2: de casas, 3: de vida, ... , etc.) y en cada uno de ellos puede proveer hasta 200 pólizas. De cada póliza se conoce el monto asegurado, el valor de la cuota mensual y la fecha de comienzo y fin de la cobertura. Además una póliza corresponde a un cliente de quien se conoce DNI, nombre y apellido. Un mismo cliente puede tener más de una póliza, incluso en el mismo rubro.

1) Modele el problema generando las clases que considere necesarias, cada una con los constructores, estado, getters y setter que considere necesarios.
2) Implemente en las clases realizadas los métodos necesarios para incorporar la siguiente funcionalidad:
    - `void agregarPoliza(Poliza unaPoliza, int unRubro)`: Ingresa una nueva póliza en el rubro recibido.
    - `String infoCliente(int unDNI)`: Devuelve un string con toda la información de todas las pólizas del cliente cuyo DNI se recibe.
    - `void aumentarCuotas(double unPorcentaje, int unRubro)`: Aumenta el valor de las cuotas de todas las pólizas vigentes de un rubro. El nuevo valor de la cuota se calcula como valorActual * unPorcentaje.
    - `Int cantidadAVencer(int mes, int año)`: Devuelve la cantidad de pólizas cuya fecha de finalización coincide con el mes y año recibido.
3) Implemente una función main que simule el ingreso de cinco pólizas, imprima la información de un cliente cuyo DNI se lee por teclado, aumente el valor de las cuotas un 1.11 en el rubro seguro de vida (código 3) e imprima la cantidad de pólizas que se vencen en abril de 2024.

    ```java
    package companiaDeSeguros;

    public class CompaniaDeSeguros {

        public static void main(String[] args) {
            Cliente c0 = new Cliente("Cliente1", "ApellidoCliente1", 0);
            Cliente c1 = new Cliente("Cliente1", "ApellidoCliente1", 1);
            Cliente c2 = new Cliente("Cliente1", "ApellidoCliente1", 2);
        
            Poliza p1 = new Poliza(1, 1, "Agosto 1991", "Agosto 1993", c0);
            Poliza p2 = new Poliza(2, 2, "Septiembre 1991", "Septiembre 1993", c2);
            Poliza p3 = new Poliza(3, 3, "Junio 1991", "Julio 1993", c1);
            Poliza p4 = new Poliza(4, 4, "Noviembre 1991", "Diciembre 1993", c2);
            Poliza p5 = new Poliza(1, 1, "Febrero 1991", "Julio 1993", c1);
        
            Compania compania = new Compania();
            compania.agregarPoliza(p1, 0);
            compania.agregarPoliza(p2, 1);
            compania.agregarPoliza(p3, 2);
            compania.agregarPoliza(p4, 1);
            compania.agregarPoliza(p5, 0);
            
            System.out.println(compania.infoCliente(2));
            
            compania.aumentarCuotas(7, 1);
            
            System.out.println(compania.infoCliente(2));
            
            System.out.println("Cantidadades a vencer: " + compania.cantidadAVencer("Julio 1993"));
        }    
    }
    ```

    ```java
    package companiaDeSeguros;

    public class Compania {
        
        private Poliza[][] polizas;
        private final int maxRubros;
        private final int maxPolizas;

        public Compania() {
            this.maxRubros = 3;
            this.maxPolizas = 4;
            this.polizas = new Poliza[this.maxRubros][this.maxPolizas];
        }
        
        public void agregarPoliza(Poliza unaPoliza, int unRubro) {
            int posPoliza = 0;
            while (posPoliza < getMaxPolizas() && getPolizas()[unRubro][posPoliza] != null) {
                posPoliza++;
            }
            if (posPoliza < getMaxPolizas()) {
                getPolizas()[unRubro][posPoliza] = unaPoliza;
            }
        }
        
        public String infoCliente(int unDni){
            String infoCliente = "Información de las Pólizas del Cliente con Dni: " + unDni + " \n";
            
            for (int i = 0; i < getMaxRubros(); i++){
                for (int j = 0; j < getMaxPolizas(); j++){
                    if (getPolizas()[i][j] != null){
                        if (getPolizas()[i][j].getCliente().getDni() == unDni){
                            infoCliente+= getPolizas()[i][j].infoPoliza() + "\n";
                        }                    
                    }
                }
            }
            return infoCliente;   
        }
        
        public void aumentarCuotas(double unPorcentaje, int unRubro){
            int i = 0;
            while (i < getMaxPolizas() && (getPolizas()[unRubro][i] != null)){
                Poliza p = getPolizas()[unRubro][i];
                p.actualizarCuota(unPorcentaje);
                i++;
            }
        }
        
        public int cantidadAVencer(String fecha){
            
            int total = 0;
            int posRubro = 0;
            while (posRubro < getMaxRubros()){
                int posPoliza = 0;
                while (posPoliza < getMaxPolizas() && getPolizas()[posRubro][posPoliza] != null){
                    if (fecha.equals(getPolizas()[posRubro][posPoliza].getFechaFinCobertura()))
                        total+= 1;
                    posPoliza++;
                }
                posRubro++;
            }
            return total;
        }

        private int getMaxRubros() {
            return this.maxRubros;
        }

        private int getMaxPolizas() {
            return this.maxPolizas;
        }

        private Poliza[][] getPolizas() {
            return this.polizas;
        }        
    }
    ```

    ```java
    package companiaDeSeguros;

    public class Poliza {
        
        private double montoAsegurado;
        private double valorCuotaMensual;
        private String fechaInicioCobertura;
        private String fechaFinCobertura;
        private Cliente cliente;

        public Poliza(double montoAsegurado, double valorCuotaMensual, String fechaInicioCobertura, String fechaFinCobertura, Cliente cliente) {
            this.montoAsegurado = montoAsegurado;
            this.valorCuotaMensual = valorCuotaMensual;
            this.fechaInicioCobertura = fechaInicioCobertura;
            this.fechaFinCobertura = fechaFinCobertura;
            this.cliente = cliente;
        }
        
        public String infoPoliza(){
            String datos = "Información de la Póliza: \n";
            datos += "Monto asegurado: " + getMontoAsegurado() + ". "
                    + "Valor cuota mensual:  " + getValorCuotaMensual() + ". "
                    + "Fecha inicio cobertura: " + getFechaInicioCobertura() + ". "
                    + "Fecha fin cobertura: " + getFechaFinCobertura();
            
            return datos;
        }
        
        public void actualizarCuota(double unProcentaje){
            setValorCuotaMensual(getValorCuotaMensual()*unProcentaje);
        }
        
        // SETTERS AND GETTERS   
    }
    ```

    ```java
    package companiaDeSeguros;

    public class Cliente {
        private String nombre;
        private String apellido;
        private int dni;
        
        private int maxRubros;
        private int maxPolizas;
        private Poliza[][] polizas;

        public Cliente(String nombre, String apellido, int dni) {
            this.nombre = nombre;
            this.apellido = apellido;
            this.dni = dni;
            this.maxRubros = 10;
            this.maxPolizas = 200;
            this.polizas = new Poliza[10][200];
        }

        // GETTERS AND SETTERS       
    }
    ```

### Taller de programación - Programación orientada a objetos - 12/03/2024

Queremos representar sectores de una **fábrica automotriz**, sus empleados y productos. Un sector posee un nombre, un empleado jefe y los empleados que trabajan en el sector (hasta 50 como máximo). Cualquier sector puede estar trabajando hasta en un máximo de N productos al mismo tiempo.

De cada empleado (incluyendo los jefes de sectores) se desea saber su nombre, apellido y antigüedad.

De cada producto se desea saber su código, el costo total y la etapa en la cual se encuentra (un número de 1 a 5).

1) Implemente el modelo de clases teniendo en cuenta:
    - Un sector solo debería poder construirse con el nombre y la cantidad máxima N de productos en los que puede trabajar.
    - Un trabajador solo debería poder construirse con su nombre, apellido y antigüedad.
    - Todo producto debe ser creado a partir de un código, costo igual a cero y etapa igual a uno.
2) Implemente los siguientes métodos (en las clases donde corresponda) que permitan realizar la tarea indicada:
    - `void agregarEmpleado(unEmpleado, esJefe)`: agrega un empleado a un sector. Si `esJefe` es verdadero entonces el empleado se agrega como jefe del sector, en caso contrario se agrega como empleado ordinario.
        > NOTA: asuma que hay lugar disponible.

    - `void agregarProducto(unProducto)`: agrega un producto a un sector.
        > NOTA: asuma que hay lugar disponible.

    - `double costoTotal(unaEtapa)`:  devuelve el costo total de los productos que están en el número de etapa pasado como parámetro

    - `void cambiarEtapa(unCodProducto, unCosto)`: aumenta en una unidad la etapa del producto con el código pasado por parámetro. Además, a ese producto también le suma el costo pasado por parámetro.

    - `String toString()`: devuelve un String que tiene el nombre del sector, todos los datos del jefe, la cantidad total de productos en los que está trabajando, el costo total de todos los productos finalizados (los que están en etapa 5) y todos los datos de los trabajadores cuya antigüedad sea mayor a 10.

> NOTA: puede crear todos los métodos auxiliares que considere necesario.
3) Escriba un programa principal que cree un sector, agréguele un jefe y dos trabajadores. Agregue dos productos y haga avanzar hasta la última etapa a uno de ellos. Luego imprima por consola la representación del sector.

    ```java
    package fabricaAutomotriz;

    public class Sector {
        private String nombre;
        
        private Empleado jefe;
        
        private int maxEmpleados;
        private int dimLEmpleados;
        private Empleado[] empleados;
        
        private int maxProductos;
        private int dimLProductos;
        private Producto[] productos;

        public Sector(String nombre, int maxProductos) {
            this.nombre = nombre;
            
            this.maxEmpleados = 50;
            this.dimLEmpleados = 0;
            this.empleados = new Empleado[maxEmpleados];
            
            this.maxProductos = maxProductos;
            this.dimLProductos = 0;
            this.productos = new Producto[maxProductos];
        }
        
        public void agregarEmpleado(Empleado unEmpleado, boolean esJefe){
            if (esJefe){
                this.setJefe(unEmpleado);
            }
            else {
                if (this.getDimLEmpleados() < this.getMaxEmpleados()){
                    this.getEmpleados()[this.getDimLEmpleados()] = unEmpleado;
                    this.setDimLEmpleados(this.getDimLEmpleados() + 1);    
                }        
            }
        }
        
        public void agregarProducto(Producto unProducto){
            if (getDimLProductos() < getMaxProductos()){
                getProductos()[getDimLProductos()] = unProducto;
                setDimLProductos(getDimLProductos() + 1);
            }
        }

        public double costoTotal(int unaEtapa){
            double costoTotal = 0;
            for(int i = 0; i < getDimLProductos(); i++){    
                if (getProductos()[i].getEtapa() == unaEtapa){
                    costoTotal+= getProductos()[i].getCosto();
                }
            }
            return costoTotal;
        }
        
        public void cambiarEtapa(int unCodProducto, double unCosto){
            int posicion = 0;
            while (posicion < getDimLProductos() && (getProductos()[posicion].getCodigo() != unCodProducto)){
                posicion++;
            }
            if (getProductos()[posicion].getCodigo() == unCodProducto){
                getProductos()[posicion].actualizarProducto(unCosto);
            }
            else {
                System.out.println("No hay producto con el código ingresado.");
            }
        }
        
        @Override
        public String toString (){
            String datos = "Nombre del Sector: " + getNombre() + " \n";
            datos+= "Datos del Jefe: " + getJefe().toString()+ " \n";
            datos+= "Costo total de productos finalizados: " + costoTotalProductosFinalizados()+ " \n";
            
            datos+= "Empleados con antiguedad mayor a 10 años:  \n";
            for(int posEmpleado = 0; posEmpleado < getDimLEmpleados(); posEmpleado++){
                if (getEmpleados()[posEmpleado].getAntiguedad() > 10){
                    datos+= getEmpleados()[posEmpleado].toString() + " \n";
                }
            }
            return datos;
        }
        
        private double costoTotalProductosFinalizados() {
            int costoTotalProductosFinalizados = 0;
            for (int i = 0; i < getDimLProductos(); i++){
                if (getProductos()[i].estadoFinalizado()){
                    costoTotalProductosFinalizados+= getProductos()[i].getCosto();
                }
            }
            return costoTotalProductosFinalizados;
        }
        
        // GETTERS AND SETTERS
    }
    ```

    ```java
    package fabricaAutomotriz;

    public class Empleado {

        private String nombre;
        private String apellido;
        private int antiguedad;

        public Empleado(String nombre, String apellido, int antiguedad ) {
            this.nombre = nombre;
            this.apellido = apellido;
            this.antiguedad = antiguedad;
        }

        public Empleado() {

        }
        
        @Override
        public String toString(){
            String datos = ("Nombre: " + getNombre() +" | Apellido: "+ getApellido());
            return datos;
        }

        // GETTERS AND SETTERS
    }
    ```

    ```java
    package fabricaAutomotriz;

    public class Producto {

        private int codigo;
        private double costo;
        private int etapa;

        public Producto(int codigo) {
            this.codigo = codigo;
            this.costo = 0;
            this.etapa = 1;
        }
        
        boolean estadoFinalizado() {
            return etapa == 5;
        }
        
        void actualizarProducto(double unCosto) {
            this.setCosto(getCosto() + unCosto);
            this.setEtapa(getEtapa() + 1);
        }
        
        // GETTERS AND SETTERS
    ```

    ```java
    package fabricaAutomotriz;

    public class FabricaAutomotriz { 
        public static void main(String[] args) {
            
            Sector sector = new Sector("Sector 1", 5);
            
            Empleado jefe = new Empleado("Jefe", "ApellidoDelJefe", 20);
            sector.agregarEmpleado(jefe, true);
            
            Empleado e1 = new Empleado("Empleado1", "ApellidoDelEmpleado1", 1);
            sector.agregarEmpleado(e1, false);
            
            Empleado e2 = new Empleado("Empleado2", "ApellidoDelEmpleado2", 2);
            sector.agregarEmpleado(e2, false);
            
            Empleado e3 = new Empleado("Empleado3", "ApellidoDelEmpleado3", 13);
            sector.agregarEmpleado(e3, false);
            
            Producto p1 = new Producto(1); Producto p2 = new Producto(2);
            Producto p3 = new Producto(3); Producto p4 = new Producto(4);
            Producto p5 = new Producto(5);

            sector.agregarProducto(p1); sector.agregarProducto(p2);
            sector.agregarProducto(p3); sector.agregarProducto(p4);
            sector.agregarProducto(p5); 
            
            sector.cambiarEtapa(4, 4); sector.cambiarEtapa(4, 4);
            sector.cambiarEtapa(4, 4); sector.cambiarEtapa(4, 4);
            sector.cambiarEtapa(2, 2); sector.cambiarEtapa(2, 2);
            sector.cambiarEtapa(2, 2); sector.cambiarEtapa(2, 2);
            
            for (int i = 0; i < sector.getDimLEmpleados(); i++) {
                System.out.println("Empleado número "+ i + ": "+ sector.getEmpleados()[i].getNombre());
            }
            
            System.out.println(sector.toString());
        }
    }
    ```

## Concurrente

### Final Taller de programación - Módulo Concurrente - 30/11/2023
Implemente el siguiente juego: Existe un área compartida delimitada por las esquinas (1,1) (20,20), dos robots jugadores y un robot fiscalizador.</br>
Ambos robots jugadores juegan simultáneamente y durante el juego tiene cinco intentos para posicionarse en una esquina del área compartida determinada al azar (elegida por el robot fiscalizador), junta todas las flores de esa esquina y vuelve a su esquina original informando al fiscalizador cuántas flores juntó en dicha esquina. Cuando los dos robots jugadores finalizan sus cinco intentos, el robot fiscalizador determinará e informará quien es el robot ganador (el que más flores juntó en total).</br>
El robot perdedor se debe posicionar en la esquina (25,25) y depositar todas las flores juntadas por él. 
> Notas: Los robots jugadores se posicionan inicialmente en (21,21), (22,22) y el robot fiscalizador en la esquina (23,23).

