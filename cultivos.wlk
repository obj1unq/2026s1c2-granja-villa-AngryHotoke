import personaje.*
import wollok.game.*

class Maiz {
	var property position
	var property image = "corn_baby.png"

	method madurar() {
	  image = "corn_adult.png"
	}
	method listoParaLaCosecha() {
	  return image == "corn_adult.png"
	}
}
class Trigo {
	var property position 
	var property image = "wheat_0.png"
	var property etapaEvolutiva = 0
	
	method madurar() { //mejorar este choclaso
	  if(etapaEvolutiva == 3){
		image = "wheat_0.png"
		etapaEvolutiva = 0
	  }else{
		if(etapaEvolutiva == 0){
			image = "wheat_1.png"
			etapaEvolutiva = 1
		}else{
			if(etapaEvolutiva == 1){
				image = "wheat_2.png"
				etapaEvolutiva = 2
			}else{
				if(etapaEvolutiva == 2){
					image = "wheat_3.png"
					etapaEvolutiva = 3
				}
			}
		}
	  }
	}
	method listoParaLaCosecha() {
	  return self.image() == "wheat_2.png" || self.image() == "wheat_3.png"
	}
}
class Tomaco {

	var property position
	
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}
	method madurar() {
		if(position.y()==game.height() -1){
	  position = game.at(self.position().x(), 0)
		}else{
			position = position.up(1)
		}
	}
	method listoParaLaCosecha() {
	  return self.image() == "tomaco.png"
	}
}

