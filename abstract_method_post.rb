class Tiger
  def initialize(name)
    @name = name
  end

  def eat
    puts "トラの#{@name}は食べたいものを何でも食べます"
  end

  def sleep
    puts "トラの#{@name}は眠くなったら眠ります"
  end
end

class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "アヒルの#{@name}は食事中です"
  end

  def sleep
    puts "アヒルの#{@name}は寝ました"
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "カエルの#{@name}は食事中です"
  end

  def sleep
    puts "カエルの#{@name}は寝ました"
  end
end

class Habitat
  def initialize(organism_factory)
    @organism_factory = organism_factory
    @animal = @organism_factory.new_animal("動物A")
    @plant = @organism_factory.new_plant("植物A")
  end

  def simulate_one_day
    @animal.eat
    @animal.sleep
    @plant.grow
  end

  def new_organism(type, name)
    if type == :animal
      @animal_class.new(name)
    elsif type == :plant
      @plant_class.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "スイレンの#{@name}は浮きながら日光を浴びて育ちます"
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    puts "樹木の#{@name}が高く育っています"
  end
end

class OrganismFactory
  def initialize(animal_class, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class
  end

  def new_animal(name)
    @animal_class.new(name)
  end

  def new_plant(name)
    @plant_class.new(name)
  end
end

class PondOrganismFactory
  def new_animal(name)
    Duck.new(name)
  end

  def new_plant(name)
    WaterLily.new(name)
  end
end

class JungleOrganismFactory
  def new_animal(name)
    Tiger.new(name)
  end

  def new_plant(name)
    Tree.new(name)
  end
end

pond = Habitat.new(PondOrganismFactory.new)
pond.simulate_one_day

jungle = Habitat.new(JungleOrganismFactory.new)
jungle.simulate_one_day

jungle_organism_factory = OrganismFactory.new(Tiger, Tree)
jungle = Habitat.new(jungle_organism_factory)
jungle.simulate_one_day