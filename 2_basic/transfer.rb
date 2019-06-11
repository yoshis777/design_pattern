# 委譲
class Engine
  def start

  end

  def stop

  end
end

class Car
  def initialize
    # 集約
    @engine = Engine.new
  end

  def start_engine
    # 委譲（Engineクラスに処理をまかせる）
    @engine.start
  end

  def stop_engine
    @engine.stop
  end
end

