##Este script es para la tarea 7.1

#Cargar los datos
maices<-read.delim(file="../meta/maizteocintle_SNP50k_meta_extended.txt")

#Que tipo de objeto creamos al cargar la base?
class(maices)

#Como se ven las primeras 6 lineas? 
head(maices)

#Cuántas muestras hay?
nrow(maices)

#De cuántos estados se tienen muestras?
levels(maices [,5])

#Cuántas muestras fueron colectadas antes de 1980?
length(which(maices$A.o._de_colecta<1980))

#Cuántas muestras hay de cada raza?
table(maices$Raza)

#A que altitud fueron colectadas las muestras en promedio?
mean(maices$Altitud)

#A que altitud maxima y minima fueron colectadas?
max(maices$Altitud)
min(maices$Altitud)

#Crea nueva df de datos solo con las muestras de la raza Olotillo
olotillo <- subset(maices, Raza=="Olotillo")

#Crea nueva df de datos solo con las muestras de Reventador, Jala y Ancho
Rev_Ja_An <- maices[maices$Raza == c("Reventador", "Jala", "Ancho"),]


write.csv(Rev_Ja_An, "../meta/submat.cvs")
