class Planning
  attr_accessor :shifts

  def initialize(attributes = {})
    @id = attributes[:id]
    @shifts = []
  end


  def compute_wages
    wages = {}

    shifts.each do | shift|
      worker_id = shift.worker.id
      if wages.key? worker_id
        wages[shift.worker.id] += shift.worker.price_per_shift
      else
        wages[shift.worker.id] = shift.worker.price_per_shift
      end
    end

    { workers: wages.map { |wage| {id: wage[0], price: wage[1]} } }
  end
end
