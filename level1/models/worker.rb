class Worker
  attr_reader :id, :price_per_shift
  def initialize(attributes = {})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @price_per_shift = attributes[:price_per_shift]
  end
end
