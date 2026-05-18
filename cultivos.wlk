import personaje.*
import wollok.game.*

class Maiz {
	var property position
	var property image = "corn_baby.png"

	method madurar() {
	  image = "corn_adult.png"
	}
}
class Trigo {
	var property position 
	
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
}
class Tomaco {

	var property position
	
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}
}

