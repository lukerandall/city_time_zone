require "sqlite3"
require "city_time_zone/seed_data"

module CityTimeZone
  class Database
    def initialize
      @database = SQLite3::Database.new("data/data.db")
      seed_if_needed!
    end

    def execute(*args)
      @database.execute(*args)
    end

    def self.seed!
      database = self.new
      database.send :seed!
    end

    private

    def seed_if_needed!
      return if table_exists?
      seed!
    end

    def seed!
      create_tables!
      execute "BEGIN TRANSACTION"
      CityTimeZone::SeedData.each do |values|
        execute "INSERT INTO cities (name, timezone) VALUES (?, ?)", values
      end
      execute "COMMIT TRANSACTION"
    end

    def table_exists?
      result = execute "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='cities';"
      return false unless result.size == 1
      result.first == [1]
    end

    def create_tables!
      execute "DROP TABLE IF EXISTS cities;"
      sql = <<-SQL
        CREATE TABLE cities(
          id INTEGER PRIMARY KEY ASC,
          name VARCHAR(255),
          timezone TEXT(120)
        );
      SQL
      puts execute sql
    end

  end
end
