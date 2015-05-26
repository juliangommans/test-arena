class Animal
  constructor: (@name) ->

  legs: (text) ->
    $("ul").append("#{text} #{runHandlebar()}.</font></li>")

class Mammal extends Animal

  legs: (amount) ->
    speed = parseInt(amount)*12.5
    super("<li><font color='red'>#{@name} has #{amount} legs, they an travel at #{speed} kilometers per hour")

class Reptile extends Animal

  legs: (amount) ->
    speed = parseInt(amount)*5 + 40
    super("<li><font color='green'>#{@name} has #{amount} legs, they can travel at #{speed} kilometers per hour")

class Avian extends Animal

  legs: (amount) ->
    speed = 50
    super("<li><font color='blue'>#{@name} has #{amount} legs, they can travel at #{speed} kilometers per hour")

