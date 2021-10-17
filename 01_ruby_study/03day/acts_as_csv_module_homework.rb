module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents.push(CsvRow.new(row.chomp.split(', '), @headers))
        p row.chomp.split(',')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each(&block)
      @csv_contents.each do |row|
        block.call row
      end
    end
  end
end

class RubyCsv # 没有继承，你可以自由添加
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  attr_accessor :row

  def initialize(row_array, headers)
    @row = row_array
    @headers = headers
  end

  def method_missing(name, *args)
    idx = @headers.index(name.to_s)
    p @headers
    p name.to_s
    p idx

    if idx.nil?
      nil
    else
      @row[idx]
    end
  end
end

csv = RubyCsv.new
csv.each { |row| puts row.two }
csv.each { |row| puts row.one }
