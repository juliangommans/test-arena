class Animal
  constructor: (@name) ->

  legs: (text) ->
    $("ul").append("#{text}")

class Mammal extends Animal

  legs: (amount) ->
    speed = parseInt(amount)*12.5
    super("<li><font color='red'>#{@name} has #{amount} legs and because they're a mammal, can travel at #{speed} kilometers per hour.</font></li>")

class Reptile extends Animal

  legs: (amount) ->
    speed = parseInt(amount)*5 + 40
    super("<li><font color='green'>#{@name} has #{amount} legs and because they're a reptile, can travel at #{speed} kilometers per hour.</font></li>")

class Avian extends Animal

  legs: (amount) ->
    speed = 50
    super("<li><font color='blue'>#{@name} has #{amount} legs and because they're Avian, can travel at #{speed} kilometers per hour.</font></li>")

