#install.packages("caret")

library(caret)

url <- "https://raw.githubusercontent.com/AliVGaribay/Particionamiento-SSP-SBC/main/irisbin.csv"

particionAleatoria <- function(dataset, listaPorcentajes){
	resultado <- list()
	contador <- 0
	
	datasetMezclado <- dataset[sample(nrow(data)), ]
	
	for(porcentaje in listaPorcentajes){
		resultado <- append(resultado, datasetMezclado[(contador + 1) : (contador + (nrow(dataset) * (porcentaje / 100))), ])
		contador <- round(contador + (nrow(dataset) * (porcentaje / 100)))
		print(contador)
	}
	
	return(resultado)
}

particionSecuencial <- function(dataset, listaPorcentajes){
	resultado <- list()
	contador <- 0
	
	for(porcentaje in listaPorcentajes){
		resultado <- append(resultado, dataset[(contador + 1) : (contador + (nrow(dataset) * (porcentaje / 100))), ])
		contador <- round(contador + (nrow(dataset) * (porcentaje / 100)))
	}
	
	return(resultado)
}

particionSecuencialInversa <- function(dataset, listaPorcentajes){
	resultado <- list()
	contador <- nrow(dataset)
	
	for(porcentaje in listaPorcentajes){
		resultado <- append(resultado, dataset[((contador - (nrow(dataset) * (porcentaje / 100))) + 1) : contador, ])
		contador <- round(contador - (nrow(dataset) * (porcentaje / 100)))
	}
	
	return(resultado)
}

particionEstratficada <- function(dataset, porcentajeTrain, variableObjetivo){
	datasetCopia <- data.frame(dataset)
	
	partition <- createDataPartition(datasetCopia$variable_objetivo, p = (porcentajeTrain / 100), list = FALSE)
	conjunto_entrenamiento <- tu_data[partition, ]
	conjunto_prueba <- tu_data[-partition, ]
	
	return(list(conjunto_entrenamiento, conjunto_prueba))
}

datos <- read.csv(file = url, head = TRUE, sep = ",")

particionado1 <- particionAleatoria(datos, list(50,25,25))
particionado2 <- particionSecuencial(datos, list(50,30,20))
particionado3 <- particionSecuencialInversa(datos, list(80,15,5))
particionado4 <- particionEstratficada(datos, 80, datos[6])

plot(particionado1[1][1],particionado1[1][2],col = "red")
points(particionado1[2][1],particionado1[2][2],col = "green")
points(particionado1[3][1],particionado1[3][2],col = "blue")

plot(particionado2[1][1],particionado2[1][2],col = "red")
points(particionado2[2][1],particionado2[2][2],col = "green")
points(particionado2[3][1],particionado2[3][2],col = "blue")

plot(particionado3[1][1],particionado3[1][2],col = "red")
points(particionado3[2][1],particionado3[2][2],col = "green")
points(particionado3[3][1],particionado3[3][2],col = "blue")

plot(particionado4[1][1],particionado4[1][2],col = "red")
points(particionado4[2][1],particionado4[2][2],col = "green")