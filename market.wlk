import wollok.game.*
import personaje.*

class Market {
  var property image = "market.png"
  var property position
  const property inventario = []
  var property oroDisponible = 0
  
  method efectuarCompra() {
    self.validarCompra()
    self.inventario().add(personaje.baul())
    oroDisponible = oroDisponible - personaje.valorTotalDelBaul()
  }
  method validarCompra() {
    if(not self.tengoDineroSuficiente()){
        self.error("No tengo dinero suficiente para comprar tus cosas...")
    }
  }
  method tengoDineroSuficiente() {
    return oroDisponible >= personaje.valorTotalDelBaul()
  }
}
const marketNorte = new Market(position = game.at(5,0), oroDisponible = 1000)
const marketSur = new Market(position = game.at(5,9), oroDisponible = 1000)
