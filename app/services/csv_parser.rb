require 'csv'

class CsvParser
  def self.parse(file)
    CSV.read(file)
  end
end
