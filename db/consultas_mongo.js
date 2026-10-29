// Prueba: Obtener todos los personajes de clase Mago
db.personajes.find({ clase: "Mago" })
db.personajes.find({ nivel: { $gte: 10 } })