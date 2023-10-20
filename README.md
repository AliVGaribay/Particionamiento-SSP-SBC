# Particionamiento-SSP-SBC
Tarea 19/10/2023

En el codigo se cuenta con 4 funciones para realizar el particionado.
  1.- particionAleatoria(dataset, listaPorcentajes): Esta funcion recibe como parametros al dataset y una lista
  con los porcentajes de cada particion de las cuales el usuario de la funcion se debe asegurar de que sumen 100
  La funcion retorna una lista cuyos elementos son las particiones del dataset en el orden en que se especificaron
  los porcentajes. Esta funcion primero revuelve el dataset antes de particionar

  2.- particionSecuencial(dataset, listaPorcentajes): Hace lo mismo que la anterior, pero sin revolver el data set
  lo que ocasiona que se tomen los datos en el orden en que estan previamente distribuidos

  3.- particionSecuencialInversa(dataset, listaPorcentajes): Hace lo mismo que la anterior pero comienza a tomar las
  particiones comenzando por el final del dataset

  4.- particionEstratificada(dataset, porcentajeTrain, variableObjetivo): Esta funcion particiona solamente en set de 
  objetivo y pruebas, de ahi que solo se pida el porcentaje de entrenamiento y el resto se usa para pruebas. Esta 
  funcion arroja un set de entrenamiento y de prueba pero los arroja estratificados (equitativamente repartidos entre 
  las clases), por eso se pide la variableObjetivo(clase).
