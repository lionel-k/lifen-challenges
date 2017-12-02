class Shift
  attr_accessor :id, :worker, :planning, :start_date

  def initialize(attributes = {})
    @id = attributes[:id]
    @worker = attributes[:worker]
    @planning = attributes[:planning]
    @start_date = attributes[:start_date]
  end
end
