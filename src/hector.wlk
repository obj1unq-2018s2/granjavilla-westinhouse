import plantas.*

object hector {
	var property plantasCosechadas = []
	var property dinero = 0
	var property posicion = game.at(2,2)
	
	method imagen() = "player.png"
	
	//metodo que reacciona ante una tecla
	method plantaMaiz(){
		if (game.colliders(self).isEmpty()){
			game.addVisualIn(new Maiz(), self.posicion().clone())
		}
		else{ throw new Exception( "Ya hay algo plantado!")}
	}
	
	
	method plantaTrigo(){
		if(game.colliders(self).isEmpty()){
			game.addVisualIn(new Trigo(), self.posicion().clone())	
		}
		else{ throw new Exception( "Ya hay algo plantado!")}
	}
	
	
	method plantaTomaco(){
	/*
	 * Si en el lugar donde Héctor esta parado no hay ninguna planta, crea un tomaco
	 * y lo guarda en una constante. Luego, le pasa su posicion a tomaco, para finalmente
	 * con el metodo "addVisual", agregar al tomaco.
	 * La diferencia es que la posicion la obtiene de tomaco, no de Héctor. Esto me permitirá
	 * mover el tomaco por el tablero mas adelante sin inconvenientes.
	 */
		if(game.colliders(self).isEmpty()){
			const nuevaPlanta = new Tomaco()
			nuevaPlanta.posicion(self.posicion().clone())
			game.addVisual(nuevaPlanta)
		}
		else{ throw new Exception( "Ya hay algo plantado!")}
	}
	
	
	method regar(){
    //Si la lista "colliders" no está vacia, devuelve el primer elemento (una planta)
    //y se le aplica el metodo "esRegada()". Caso contrario, devuelve una excepcion.
    
			if (!game.colliders(self).isEmpty()){
				game.colliders(self).first().esRegada()	
			}
			else{ game.say(self, "No hay nada para regar") }
	}
	
	method cosechar(){
	//Si la lista "colliders" no está vacia, devuelve el primer elemento (una planta)
    //y se le aplica el metodo "esCosechada()". Caso contrario, devuelve una excepcion.
    
		if(!game.colliders(self).isEmpty()){
			plantasCosechadas.add(game.colliders(self).first())
			game.removeVisual(game.colliders(self).first())
			
	    }
	    else { game.say(self, "No hay nada para cosechar")}
	}
	
	method vender(){
		plantasCosechadas.forEach { planta => dinero += planta.valor()}
		plantasCosechadas = []
	}
	
	
	
	
	
	
}
