require "active_support/values/time_zone"
require "active_support/core_ext/enumerable"

module CityTimeZone
  class SeedData

    FIELDS = {
      :id              => 0,
      :name            => 1,
      :ascii_name      => 2,
      :alternate_names => 3,
      :latitude        => 4,
      :longitude       => 5,
      :country         => 8,
      :timezone        => 17
    }

    MAPPING = ActiveSupport::TimeZone::MAPPING.each_with_object({}) do |field, mapping|
      mapping[field.last] = field.first
    end

    def self.each
      # cities.txt is a city time zone data file from GeoNames (http://www.geonames.org/).
      File.open("data/cities.txt") do |f|
        f.each_line do |row|
          fields = row.split("\t")
          timezone = MAPPING[fields[FIELDS[:timezone]]]
          yield [fields[FIELDS[:ascii_name]], timezone] if timezone
        end
      end
    end
  end
end
