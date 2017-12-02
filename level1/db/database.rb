require 'json'

require_relative "../models/planning.rb"
require_relative "../models/shift.rb"
require_relative "../models/worker.rb"

class Database
  attr_reader :workers, :planning

  def initialize(data_file_path, output_file_path)
    @data_file_path = data_file_path
    @output_file_path = output_file_path
    @workers = []
    @planning = Planning.new(id: 1) # We will have only one planning for all the exercises
    load
  end

  def load
    serialized_data = File.read(@data_file_path)
    @data = JSON.parse(serialized_data)
    load_workers
    load_shifts
  end

  def save(data)
    File.open(@output_file_path, 'wb') do |file|
      file.write(JSON.generate(data))
    end

  end

  private

  def load_workers
    @workers = @data["workers"].map do |data_worker|
      Worker.new(id: data_worker["id"],
        first_name: data_worker["first_name"],
        price_per_shift: data_worker["price_per_shift"])
    end

  end

  def load_shifts
    @planning.shifts = @data["shifts"].map do |data_shift|
      Shift.new(id: data_shift["id"],
        worker: @workers[data_shift["user_id"].to_i - 1],
        planning: @planning,
        start_date: data_shift["start_date"])
    end
  end
end
