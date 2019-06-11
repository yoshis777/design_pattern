# Strategy パターン（Proc化）
  # 継承の代わりに委譲を用いる
  # バリエーション毎にサブクラスを作り変化するコードをクラスに閉じ込める
  # Procを用いて、関数の受け渡しが行えるようになる
  # 基底クラス（ここではインターフェース代わり）がシンプル（メソッド数が比較的少ない）の場合、Procを用いると柔軟性が増す

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter) # コードブロックを受け取る
    @title = '月次報告'
    @text = ['順調', '最高の調子']
    @formatter = formatter
  end

  # メソッドが１つしかなくシンプルな場合、Procにすると複雑にならないまま柔軟性が増す
  def output_report
    @formatter.call(self)
  end
end

# レポート処理自体をサブクラスに分ける
HTML_FORMATTER = proc do |context|
  puts "<title>#{context.title}</title>"
  puts '<body>'
  context.text.each do |line|
    puts "<p>#{line}</p>"
  end
  puts '</body>'
end

PLAIN_FORMATTER = proc do |context|
  puts("***#{context.title}***")
  context.text.each do |line|
    puts("***#{line}***")
  end
end

report = Report.new(&HTML_FORMATTER)
report.output_report

report.formatter = PLAIN_FORMATTER
report.output_report

report = Report.new {puts 'その場だけの出力'}
report.output_report
