require 'pry'
class Owner
  # code goes here
  @@all = []
  attr_reader :name, :species 
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  def self.all
    @@all
  end
  def say_species 
    return "I am a #{self.species}."
  end
  def self.count
    self.all.count 
  end
  def self.all=(all)
    @@all = all
  end

  def self.reset_all
    self.all = []
  end
  def cats
    Cat.all.select do |cat|
      cat.owner == self 
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
      #binding.pry 
    end
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end





end
#binding.pry
