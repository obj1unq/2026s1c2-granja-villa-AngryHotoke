import wollok.game.*
import personaje.*


class Aspersor {
  var property position
  var property image = "aspersor.png" 

  // method regar() {
  //   const aspersor = new Aspersor(position = personaje.position())
	// 	personaje.ponerHerramienta(aspersor)
	// 	aspersor.activarAspersor()
  // }
  method activarAspersor() {
    game.onTick(1000, "regar", {self.esparcirAguaAlrededor()})
  }
  method esparcirAguaAlrededor() {
    game.getObjectsIn(position.up(1)).forEach({planta => planta.madurar()})
    game.getObjectsIn(position.down(1)).forEach({planta => planta.madurar()})
    game.getObjectsIn(position.left(1)).forEach({planta => planta.madurar()})
    game.getObjectsIn(position.right(1)).forEach({planta => planta.madurar()})
  }
  method madurar() {
    return 
  }
}