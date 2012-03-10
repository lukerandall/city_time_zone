require "city_time_zone/database"

module CityTimeZone
  class Lookup
    def self.find(name)
      sql = "SELECT timezone FROM cities WHERE name = ?"
      result = CityTimeZone::Database.new.execute sql, name
      return unless result.count == 1
      result.first.first
    end
  end
end
