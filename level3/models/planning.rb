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
      bonus = shift.is_on_weekend? ? 2 : 1
      if wages.key? worker_id
        wages[shift.worker.id] += shift.worker.price_per_shift * bonus
      else
        wages[shift.worker.id] = shift.worker.price_per_shift * bonus
      end
    end

    { workers: wages.map { |wage| {id: wage[0], price: wage[1]} } }
  end
end
