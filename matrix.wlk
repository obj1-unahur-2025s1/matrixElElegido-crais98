object nave {
  const pasajeros = [neo, morfeo]

  method cantidadPasajeros() = pasajeros.size()
  method pasajeroDeMayorVitalidad() =
    pasajeros.max({pax => pax.vitalidad() } )

    method estaEquilibrado() { 
        self.pasajeroDeMayorVitalidad().vitalidad() < 
        self.pasajeroDeMenorVitalidad()*2
    }

    method pasajeroDeMenorVitalidad() = pasajeros.min({pax => pax.vitalidad() } )
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar() {
      self.pasajerosNoEsElElegido().forEach({{p => p.saltar()}})
    }
    method pasajerosNoEsElElegido() = pasajeros.filter({p => not p.esElElegido()}) 
}


object neo {
  var energia = 100

  method energia() = energia 
  method vitalidad() = energia*0.1
  method esElElegido() = true
  method saltar() {energia = energia/2}
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false

  method esElElegido() = false
  method vitalidad() = vitalidad 
  method saltar() {
    vitalidad = 0.max(vitalidad - 1)
    estaCansado = not estaCansado
    }

}

object trinity {

    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {} 

}
