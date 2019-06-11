# 集約
  # 実装を本来のクラスに持たせることができる
  # A has-a B(AはBをもっている)の関係
class Engine
  def start

  end

  def stop

  end
end

# 集約されるオブジェクトの継承
class DieselEngine < Engine

end

class GasolineEngine < Engine

end

class Car
  def initialize
    # 他のオブジェクトをもたせる（集約）
    @engine = Engine.new
  end

  def sunday_drive
    @engine.start

    @engine.stop
  end

  # 継承したクラスのオブジェクトに切り替えるメソッド
  def switch_to_diesel
    @engine = DieselEngine.new
  end

  def switch_to_gasoline
    @engine = GasolineEngine.new
  end

end