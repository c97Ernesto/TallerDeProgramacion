1. Realice un programa para que un robot junte todas las flores de la avenida 1 y las deposite al final
de dicha avenida. Al finalizar, debe informar la cantidad de flores depositadas y la cantidad de
esquinas sin flores que encontró durante el recorrido. </br>
    **a.** Modifique el programa anterior para que el mismo robot realice lo mismo en las avenidas 1, 3
y 5.</br>
    **b.** Modifique el programa anterior para que el trabajo sea realizado por 3 robots: uno realiza la
avenida 1, otro realiza la avenida 3 y otro la avenida 5. Cada robot debe iniciar en las esquina
(1,1), (3,1) y (5,1) respectivamente.</br>
    - [Resolución](./Practica3-Concurrente/EjerciciosPracticos/Parte1/P1Ejercicio_01.txt)
  
2. Realice un programa en el que 4 robots limpien de papeles el perímetro de un cuadrado de lado
20 en sentido horario. </br>
El vértice inferior izquierdo del cuadrado se ubica en la esquina (10,10). </br>
Al finalizar, cada robot debe informar la cantidad de papeles juntados en su lado. </br>
Al realizar este programa, analizar: </br>
    **a.** ¿Cómo deben declararse la o las áreas? </br>
    **b.** ¿Existe riesgo de colisión? </br>
    - [Resolución](./Practica3-Concurrente/EjerciciosPracticos/Parte1/P1Ejercicio_02.txt)
  
3. Realice un programa en el que 3 robots realicen escaleras de 4 escalones. El tamaño de cada
escalón se incrementa en un 1 respecto al escalón anterior. El primer escalón será de 1x1, el
segundo de 2x2, y así sucesivamente. </br>
Al finalizar el recorrido, cada robot debe informar la cantidad de escalones en los que la
cantidad de papeles superó en 1 a la cantidad de flores. Las esquinas deben quedar sin
modificar.
    - [Resolución](./Practica3-Concurrente/EjerciciosPracticos/Parte1/P1Ejercicio_03.txt)
  
4. Realice un programa en el que dos robots se encargan de limpiar las ciudad. La ciudad se dividió
en 4 áreas: las impares (1 y 3) deben limpiarse de flores; y las pares (2 y 4) deben limpiarse de
papeles. Un robot debe encargarse de las áreas impares y otro robot de las pares. Modularice el
recorrido de cada área.
    - Área 1: desde la avenida 1 hasta la avenida 25
    - Área 2: desde la avenida 26 hasta la avenida 50
    - Área 3: desde la avenida 51 hasta la avenida 75
    - Área 4: desde la avenida 76 hasta la avenida 100
    - [Resolución](./Practica3-Concurrente/EjerciciosPracticos/Parte1/P1Ejercicio_03.txt) </br>
    
    **a.** Analizar (no es necesario implementar) qué se debería modificar si ahora se pide que la
    ciudad se divida en 20 áreas:
   - Área 1: Avenidas 1 a 5
   - Área 2: Avenidas 6 a 10
   - …
   - Área 19: Avenidas 91 a 95
   - Área 20: Avenidas 96 a 100

5. Realice un programa en el que cuatro robots realizan las siguientes actividades:
    - El robot 1 debe limpiar de flores las primeras 15 esquinas de las calles 75 y 80. Al finalizar
cada calle, debe depositar todas las flores en la última esquina.
    - El robot 2 debe limpiar de papeles las últimas 20 esquinas de las avenidas 75 y 80. Al
finalizar cada avenida debe depositar todos los papeles en la primera esquina.
    - El robot 3 debe limpiar de flores las últimas 30 esquinas de las calles 10 y 15. Al finalizar
cada calle, debe depositar todas las flores en la última esquina.
    - El robot 4 debe limpiar de papeles las primeras 10 esquinas de las avenidas 10 y 15. Al
finalizar cada avenida debe depositar todos los papeles en la primera esquina.
