# Observerパターン
  # クラスA, Bは互いに独立しているがB（従業員）にあった変化をA（経理部門）に知らせる場合

# 観察対象（従業員）
class Employee
  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary, observers = [])
    @name = name
    @title = title
    @salary = salary
    @observers = observers
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers #通知（オブザーバーは複数モテる）
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

end

# 観察者
# 経理部門
class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のために小切手を切りました"
    puts "彼の給料は月#{changed_employee.salary}円になりました"
  end
end

class Bank
  attr_accessor :amounts
  def initialize
    @amounts = 0
  end

  def update(changed_employee)
    @amounts += changed_employee.salary
    puts "#{changed_employee.name}の銀行口座に#{changed_employee.salary}円振り込まれました。"
    puts "彼の口座には#{@amounts}の貯金があります。"
  end
end

yuji = Employee.new('yuji', 'engineer', 100000)
yuji.add_observer(Payroll.new)
yuji.add_observer(Bank.new)
yuji.salary = 100000
yuji.salary = 200000

