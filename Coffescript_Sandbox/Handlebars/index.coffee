$ ->
  animalArray = []

  $("#animal").submit( (e) ->
    e.preventDefault()
    formData = $("#animal :input").serializeArray()
    assignSpecies formData
  )

  assignSpecies = (animal) ->
    if $('#batman').val() == "mammal"
      newAnimal = new Mammal animal[0].value
      newAnimal.legs(animal[2].value)
    else if $('#batman').val() == "avian"
      newAnimal = new Avian animal[0].value
      newAnimal.legs(animal[2].value)
    else
      newAnimal = new Reptile animal[0].value
      newAnimal.legs(animal[2].value)

  console.log "DOM...inated"




