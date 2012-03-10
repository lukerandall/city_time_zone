require "city_time_zone/version"
require "city_time_zone/lookup"

module CityTimeZone
  def self.lookup(name)
    CityTimeZone::Lookup.find(name)
  end
end
