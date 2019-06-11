# Strategy パターン
  # 継承の代わりに委譲を用いる
  # バリエーション毎にサブクラスを作り変化するコードをクラスに閉じ込める

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = '月次報告'
    @text = ['順調', '最高の調子']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end

class Formatter
  # フォーマッターとしての機能（同じ目的の機能をもつことだけ定義しておく）
  def output_report(context)
    raise "Abstract method called"
  end
end

# レポート処理自体をサブクラスに分ける
class HTMLFormatter < Formatter
  def output_report(context)
    puts "<title>#{context.title}</title>"
    puts '<body>'
    context.text.each do |line|
      puts "<p>#{line}</p>"
    end
    puts '</body>'
  end
end

class PlainFormatter < Formatter
  def output_report(context)
    puts("***#{context.title}***")
    context.text.each do |line|
      puts("***#{line}***")
    end
  end
end

# class Report
#   def initialize
#     @title = '月次報告'
#     @text = ['順調', '最高の調子']
#   end
#
#   def output_report
#     puts "<title>#{@title}</title>"
#     puts '<body>'
#     @text.each do |line|
#       puts "<p>#{line}</p>"
#     end
#     puts '</body>'
#   end
# end

report = Report.new(HTMLFormatter.new)
report.output_report

report.formatter = PlainFormatter.new
report.output_report

# report = Report.new
# report.output_report