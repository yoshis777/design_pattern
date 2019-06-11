# Template Method パターン（適用前）
class Report
  def initialize
    @title = '月次報告'
    @text = ['順調', '最高の調子']
  end

  def output_report
    puts "<title>#{@title}</title>"
    puts '<body>'
    @text.each do |line|
      puts "<p>#{line}</p>"
    end
    puts '</body>'
  end
end

report = Report.new
report.output_report