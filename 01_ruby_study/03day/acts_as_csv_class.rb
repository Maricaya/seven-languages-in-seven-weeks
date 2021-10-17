class ActsAsCsv
  # 打开文件,读取表头,
  # 把表头切分成一个个字段,再循环各行,把每一行的内容放入数组。
  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(',')

    file.each do |row|
      @result << row.chomp.split(',')
    end
  end

  def headers
    @headers
  end

  def csv_contents
    @result
  end

  def initialize
    @result = []
    read
  end
end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
