# City Time Zone

City Time Zone does exactly one thing - tell you the time zone of a given city.

## Usage

The simplest (and currently only) way to use city time zone is this:

    require 'city_time_zone'

    CityTimeZone.lookup "City name"

At the moment this returns the time zone using the same name as `ActiveSupport::TimeZone` uses. This differs from the format used by [tz databases](http://en.wikipedia.org/wiki/Tz_database), and not all TZ time zones map to ActiveSupport ones. The lookup suffers accordingly. Future versions of this gem will rectify that.

The first time you call `#lookup` it will take a few seconds to return as it populates its database with the cities from the data file.

## Data

City time zone data uses data from [GeoNames](http://www.geonames.org/). This is found in the `data/cities.txt` file
