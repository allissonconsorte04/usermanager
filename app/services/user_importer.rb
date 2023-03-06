class UserImporter
  attr_reader :file, :parser

  def initialize(file:, parser: CsvParser)
    @file = file
    @parser = parser
  end

  def import!
    _, *rows = data
    rows.each do |row|
      user = User.find_or_initialize_by(email: row[2])
      user.first_name = row[0]
      user.last_name = row[1]
      user.role = row[3]
      user.save(validate: false)
    end
  end

  private

  def data
    @data ||= parser.parse(file)
  end
end
