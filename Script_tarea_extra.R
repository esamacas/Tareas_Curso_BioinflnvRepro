##Este script es para la tarea extra, para mejorar un poquito la calificación...

#cargar librerías necesarias
library(maps)
library(ape)
library(devtools)

#instalar phytools
install_github("liamrevell/phytools")

library(phytools)

tree<-read.nexus("../data/All_Pmac_Unique_hap_seqs_strict_100M.trees")

#se compone de 10001 árboles

#Hacer un muestreo aleatorio de 100 árboles con un valor de seed de 1058
set.seed(1058)
tr <- rmtree(100, 100)

#Generar árbol consenso con metodo symmetric.difference
con.tree<-averageTree(tr, method="symmetric.difference")

#cargar archivo csv con los datos de las ballenas
P_macro<-read.csv("../meta/P_macro.csv")

#Graficar el árbol consenso
plot.phylo(con.tree, edge.width=0.5, show.tip=FALSE)

#colorear terminales de acuerdo a la categoria Ocean
tiplabels(pch=20, col=P_macro$Ocean)

#definir colores para la leyenda
numcolsneeded<-length(levels(P_macro$Ocean))
palette(rainbow(numcolsneeded)) 

#agregar la leyenda

legend(x= "bottomleft", legend=levels(P_macro$Ocean), pch=19, col=1:numcolsneeded, cex=1, , bty="n")  

#llamar maptools

library(maptools)

#cargar mapa

mapa<-readShapePoly("../data/GSHHS_shp/i/GSHHS_i_L1.shp")

#colorear continentes de gris
plot(mapa, col="grey")

#poner puntos de acuerdo a $clade
points(P_macro$Longitude, P_macro$Latitude, pch=19, col=P_macro$clade, cex=1.0)
