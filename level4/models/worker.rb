class Worker
  attr_reader :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    # @price_per_shift = attributes[:price_per_shift]
    @status = attributes[:status]
  end

  def price_per_shift
    case @status
    when "medic"
      270
    when "interne"
      126
    when "interim"
      480
    else
      0
    end
  end

  def is_interim?
    @status == "interim"
  end
end
