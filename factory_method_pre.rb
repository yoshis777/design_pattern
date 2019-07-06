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

class Pond
  def initialize(duck)
    @duck = duck
  end

  def simulate_one_day
    @duck.eat
    @duck.sleep
  end
end

pond = Pond.new(Duck.new("アヒル1"))
pond.simulate_one_day

