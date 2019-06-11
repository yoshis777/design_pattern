# Template Method パターン（適用後）
  # 変わるものを変わらないものと分離
  # オブジェクト指向の基本

# 基底クラス
  # 不変の部分を記述する
  # 抽象クラスとして用い、継承される前提で（このクラス自体はオブジェクト化されない）
    # （ruby流のダックタイピングには反する）
class Report
  def initialize
    @title = '月次報告'
    @text = ['順調', '最高の調子']
  end

  # レポートの構造は種類に関わらず全て一緒
  # （逆にこの出力形式部分が頻繁に変わるようだとTemplate Methodパターンは不適）
  def output_report
    output_title
    output_body_start
    output_body
    output_body_end
  end

  # 抽象メソッド（とする。基底クラスで未定義のメソッド）
  # 共通化したい場所はわかりやすくなるが、rubyのダックタイピング的には定義自体は不要っぽい
  def output_title
    # サブクラスでの実装を強制させる
    # rubyには抽象メソッドがないため、例外を発生させて代用。
    raise 'Called abstract method: output_title'
  end

  def output_body
    raise 'Called abstract method: output_body'
  end

  # フックメソッド
  # 具象クラスによってオーバーライドできるメソッド
  # 標準実装：共通化処理をかいてもいいし、空にしてサブクラスでの処理にまかせてもよい（この場合、処理しないがデフォルト）
  def output_body_start

  end

  def output_body_end

  end
end

# サブクラス
  # レポートごとに変わる（異なる）処理を記述する
class HTMLReport < Report
  def output_title
    puts "<title>#{@title}</title>"
  end

  def output_body_start
    puts '<body>'
  end

  def output_body
    @text.each do |line|
      puts "<p>#{line}</p>"
    end
  end

  def output_body_end
    puts '</body>'
  end
end

class PlainReport < Report
  def output_title
    puts "***#{@title}***"
  end

  def output_body
    @text.each do |line|
      puts "***#{line}***"
    end
  end
end

report = HTMLReport.new
report.output_report

report = PlainReport.new
report.output_report