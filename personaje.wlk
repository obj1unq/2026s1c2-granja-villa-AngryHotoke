import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	var property baul = []

	method sembrar(planta) {
		self.validarSiembra(planta)
		return game.addVisual(planta)
	}
	method validarSiembra(planta){
		if (self.hayPlantaAca()){
			self.error("OCUPADO!!")
		}
	}
	method hayPlantaAca() {
	  return game.getObjectsIn(position).size()>1 
	}
	method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) //No modifico la position en la primera linea porque volar podría lanzar error
		position = nuevaPosition //ahora si puedo modificar la posicion
	}
	method regar() {
		self.validarRiego()
		game.getObjectsIn(position).forEach({planta => planta.madurar()})
	  //game.uniqueCollider(self).madurar()
	}
	method validarRiego() {
	  if(not self.hayPlantaAca()){
		self.error("Nada que regar acá.")
	  }
	}
	method madurar() {
	  return
	}
	method cosechar() {
	  self.validarCosecha()
	  baul.add(game.uniqueCollider(self))
	  game.removeVisual(game.uniqueCollider(self))
	}
	method validarCosecha() {
	  if (not self.puedoCosecharAca()){
		self.error("No tengo nada para cosechar!")
	  }
	}
	method puedoCosecharAca(){
		return self.hayPlantaAca() && 
			game.uniqueCollider(self).listoParaLaCosecha()
	}
}
object contador {
  var property position = game.at(1,0)

  method text() {
	return "Planchas cosechadas: " + personaje.baul().size()
  }
  method textColor() {
	return "000000"
  }
}