import wollok.game.*
import market.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property baul = []
	var property totalOro = 0

	method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) //No modifico la position en la primera linea porque volar podría lanzar error
		position = nuevaPosition //ahora si puedo modificar la posicion
	}
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
	  return game.say(self,"...ta fria")
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
	method vender() {
		self.validarVenta()
		self.validarPosicionEnElMarket()
	  totalOro = totalOro + self.valorTotalDelBaul()
	  self.entregarVerduras(game.uniqueCollider(self))
	}
	method validarVenta(){
		if (self.baul().isEmpty()){
			self.error("El baul de verduras esta vacio!")
		}
	}
	method validarPosicionEnElMarket() {
		if(not self.estoyEnElMarket()){
			self.error("No estoy en el mercado!")
		}
	}
	method estoyEnElMarket() {
	  return game.getObjectsIn(position).any({market => market.image() == "market.png"})
	}
	method entregarVerduras(mercado) {
	  mercado.efectuarCompra()
	  self.baul().clear()
	}
	method valorTotalDelBaul() {
	  return self.baul().sum({planta => planta.valor()})
	}
	method cantidadDePlantasEnBaul() {
	  return self.baul().size()
	}
	method hacerInventario() {
	  game.say(self, "Tengo " + totalOro + " de oro y " + 
	  	self.cantidadDePlantasEnBaul() + " plantas listas para vender!")
	}
	method ponerHerramienta(herramienta) {
	  self.validarLugar()
	  return game.addVisual(herramienta)
	}
	method validarLugar() {
	  if(self.hayPlantaAca()){
		self.error("No puedo poner ninguna herramienta aca!")
	  }
	}
	// method activarHerramienta() {
	//   game.uniqueCollider(self).regar()
	// }
}
object contadorBaul {
  var property position = game.at(1,0)

  method text() {
	return "Valor total de la cosecha: " + personaje.valorTotalDelBaul()
  }
  method textColor() {
	return "000000"
  }
}
// object contadorOro {
//   var property position = game.at(game.width()-1,0)
//   method text() {
// 	return "Total Oro: " + personaje.totalOro()
//   }
//   method textColor() {
// 	return "000000"
//   }
// }