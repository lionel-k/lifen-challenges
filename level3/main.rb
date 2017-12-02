require_relative "db/database.rb"

DB = Database.new("db/data.json", "db/output-2.json")

planning = DB.planning

output = planning.compute_wages

DB.save(output)
