class Planning
  attr_accessor :shifts

  def initialize(attributes = {})
    @id = attributes[:id]
    @shifts = []
  end


  def compute_wages
    wages = {}
    total_wages = 0
    interim_shifts = 0

    shifts.each do | shift|
      worker_id = shift.worker.id
      bonus = shift.is_on_weekend? ? 2 : 1
      price = shift.worker.price_per_shift * bonus
      total_wages += price
      interim_shifts += shift.worker.is_interim? ? 1 : 0
      if wages.key? worker_id
        wages[shift.worker.id] += price
      else
        wages[shift.worker.id] = price
      end
    end

    commission = total_wages * SHIFT_COMMISSION + interim_shifts * INTERIM_COMMISSION

    { workers: wages.map { |wage| {id: wage[0], price: wage[1]} },
    commission: {pdg_fee: commission, interim_shifts: interim_shifts }}
  end
end
