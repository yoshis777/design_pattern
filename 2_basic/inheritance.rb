# 継承について
  # 全てのCarはエンジンを持たなければいけない
  # A is-a-kind-of B（AはBの一種である）の関係
class Vehicle
  def start_engine

  end

  def stop_engine

  end
end

class Car < Vehicle
  def sunday_drive
    start_engine

    stop_engine
  end
end