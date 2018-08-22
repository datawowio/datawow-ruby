class FileReader
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def read_json
    JSON.parse(File.read(file))
  end
end
