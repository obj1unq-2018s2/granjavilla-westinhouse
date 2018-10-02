import hector.*

class Maiz {
	
	var property imagen = "corn_baby.png"	
	var property esBebe = true
	
	method valor() = 150
	method esRegada(){
		if(esBebe){ 
			esBebe = false
			imagen = "corn_adult.png"
		}
	}

}

class Trigo {
	
	var property imagen = "wheat_0.png"
	var property etapa = 0
	
	method valor(){ return (etapa -1) * 100}
	method esRegada(){ 
		etapa = etapa + 1
		if(etapa == 1){ imagen = "wheat_1.png"}
		if(etapa == 2){ imagen = "wheat_2.png"}
		if(etapa == 3){ imagen = "wheat_3.png"}
	}

}

class Tomaco {
	
	var property imagen = "tomaco.png"
	var property posicion = null

	method valor() = 80
	method esRegada(){
		if(posicion.y()  < 9) {
			self.posicion(posicion.up(1))
		}	
	}
	
	method puedeSerCosechada() = true
}