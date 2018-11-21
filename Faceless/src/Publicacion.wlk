class Publicacion {
	var property likes=0
	var property usuariosQueDieronLike= #{}
	var property privacidad
	var property duenio
	method espacioAOcupar() = 0
	
	method puedeVer(usuario){
		
		return privacidad.puedeVerPublicacion(usuario, self)
	}
	
	method leDioLike(usuario) {return usuariosQueDieronLike.contains(usuario)}
	
}

class Foto inherits Publicacion {
	var property alto=0
	var property ancho=0
	var property factorDeComprension= 0.7
	
	override method espacioAOcupar(){
		
		return (alto * ancho) * factorDeComprension
		
	}
}

class Texto inherits Publicacion{
	
	var property caracteres=0
	
	override method espacioAOcupar() {return caracteres}
		
}

class VideoCalidadNormal inherits Publicacion {
	
	var property duracion=0
	
	override method espacioAOcupar() {return duracion}
		
}

class VideoCalidadAlta inherits VideoCalidadNormal {
	
	override method espacioAOcupar() {return super() * 3}
	
}


object publica {
	
	method puedeVerPublicacion(usuario, publiacion){return true} 
		method agregarALista(usuario){}
	method quitarDeLista(usuario){}
	
}

object soloAmigos {	
	
	method puedeVerPublicacion(usuario, publicacion) {return publicacion.duenio().esAmigoDe(usuario)}
	method agregarALista(usuario){}
	method quitarDeLista(usuario){}
}

class PrivadoConLista {
	var lista = []
	
	method agregarALista(usuario){ lista.add(usuario)}
	
	method quitarDeLista(usuario){ lista.remove(usuario)}
	
	method puedeVerPublicacion(usuario, publicacion)
}

class PrivadoConListaBlanca inherits PrivadoConLista{
	
	override method puedeVerPublicacion(usuario, publicacion){
		
			return lista.contains(usuario)
		
	}
	
}

class PrivadoConListaNegra inherits PrivadoConLista {
	
	override method puedeVerPublicacion(usuario, publicacion){
		
			return not lista.contains(usuario)
	}
}
