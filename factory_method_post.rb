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

class Pond
  def initialize(name)
    @animal = new_animal(name)
  end

  def simulate_one_day
    @animal.eat
    @animal.sleep
  end
end

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

pond = FrogPond.new("カエルA")
pond.simulate_one_day

