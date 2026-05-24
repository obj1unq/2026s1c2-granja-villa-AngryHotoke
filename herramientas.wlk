import wollok.game.*

class Aspersor {
  var property position
  var property image = "aspersor.png" 

  method regar() {
    game.tick(1000, self.esparcirAguaAlrededor(), true)
  }
  method esparcirAguaAlrededor() {
    return game.getObjectsIn(position.up()).forEach({planta => planta.madurar()})
    game.getObjectsIn(position.down()).forEach({planta => planta.madurar()})
    game.getObjectsIn(position.left()).forEach({planta => planta.madurar()})
    game.getObjectsIn(position.right()).forEach({planta => planta.madurar()})
  }
}