require_relative "db/database.rb"

DB = Database.new("db/data.json", "db/output-2.json")

SHIFT_COMMISSION = 0.05
INTERIM_COMMISSION = 80

planning = DB.planning

output = planning.compute_wages

DB.save(output)
