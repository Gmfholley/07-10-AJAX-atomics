# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("d5.db")

# Make the tables.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS tasks (id INTEGER PRIMARY KEY, content TEXT, done BOOLEAN DEFAULT 0);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true