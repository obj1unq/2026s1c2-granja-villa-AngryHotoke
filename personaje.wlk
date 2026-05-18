import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"

	method sembrar(planta) {
		self.validarSiembra(planta)
		return game.addVisual(planta)
	}
	method validarSiembra(planta){
		if (self.hayPlantaAca(planta)){
			self.error("OCUPADO!!")
		}
	}
	method hayPlantaAca(planta) {
	  return game.getObjectsIn(position).size()>1 
	}
	method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) //No modifico la position en la primera linea porque volar podría lanzar error
		position = nuevaPosition //ahora si puedo modificar la posicion
	}
	method regar(planta) {
		self.validarRiego(planta)
	  planta.madurar()
	}
	method validarRiego(planta) {
	  if(self.hayPlantaAca(planta)){
		self.error("Nada que regar acá.")
	  }
	}
}