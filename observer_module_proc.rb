# Observerパターン
  # クラスA, Bは互いに独立しているがB（従業員）にあった変化をA（経理部門）に知らせる場合

# オブザーバー管理用クラス
module Subject
  def initialize
    @observers = []
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self)
    end
  end

  def add_observer(&observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

# 観察対象（従業員）
class Employee
  include Subject
  attr_reader :name, :salary

  def initialize(name, salary)
    super()
    @name = name
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers #通知（オブザーバーは複数持てる）
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

yuji = Employee.new('yuji', 'engineer')
yuji.add_observer do |changed_employee|
  puts "Cuts a new check for #{changed_employee.name}"
  puts "His salary id now #{changed_employee.salary}"
end
yuji.add_observer do |changed_employee|
  puts "#{changed_employee.name}の銀行口座に#{changed_employee.salary}円振り込まれました。"
end
yuji.salary = 100000
yuji.salary = 200000

