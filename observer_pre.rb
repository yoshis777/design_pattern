# Observerパターン
  # クラスA, Bは互いに独立しているがB（従業員）にあった変化をA（経理部門）に知らせる場合

# 観察対象（従業員）
class Employee
  attr_reader :name, :salary
  attr_accessor :title

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self) # 通知
    # 但し、経理部門への変更通知をハードコーティングしている（一般性がない）
  end
end

# 観察者
# 経理部門
class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のために小切手を切りました"
    puts "彼の給料は月#{changed_employee.salary}円になりました"
  end
endが

yuji = Employee.new('yuji', 'engineer', 100000, Payroll.new)
yuji.salary = 999999