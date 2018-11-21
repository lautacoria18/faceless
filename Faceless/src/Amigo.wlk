class Usuario {
	var property amigos= #{}
	var property publicaciones = #{}
	
	method likearPublicacion(publicacion) {publicacion.likes(publicacion.likes() + 1)
											publicacion.usuariosQueDieronLike().add(self)
	}
	
	method likesTotales() {return publicaciones.sum{publicacion => publicacion.likes()}}
	
	method amigoMasPopular() {return amigos.max{amigo => amigo.likesTotales()}}
	
	method totalOcupado() {return publicaciones.sum{publicacion => publicacion.espacioAOcupar()}}
	
	method cantidadDeAmigos() {return amigos.size()}
	
	method esMasPopularQue(usuario) {return  self.cantidadDeAmigos()  > usuario.cantidadDeAmigos()}
	
	
	
	method esAmigoDe(usuario) {return amigos.contains(usuario)}
	
	method mejoresAmigos(){return amigos.filter{amigo => self.puedenVerTodas(amigo, self)}}
	
	method puedenVerTodas(usuario, usuarioDuenio) {return usuarioDuenio.publicaciones().all{publicacion => publicacion.puedeVer(usuario)}}

	method cantPublicacionesQueLikeo(usuario, usuarioDuenio){
//		var publicacionesTotales= []
//		
//		usuarioDuenio.publicaciones().forEach{publicacion => if (publicacion.leDioLike(usuario)) publicacionesTotales.add(publicacion)}
//		
//		return publicacionesTotales
		return usuarioDuenio.publicaciones().count{publicacion => publicacion.leDioLike(usuario)}
	}

	method stalkeaA(usuario) {
		
		return self.cantPublicacionesQueLikeo(self, usuario) >=  usuario.publicaciones().size() * 0.90 
		 
	}	
}
