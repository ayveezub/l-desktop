{ config, lib, ... }:

{
  # The time zone used when displaying times and dates.
  # See `https://en.wikipedia.org/wiki/List_of_tz_database_time_zones`
  # for a comprehensive list of possible values for this setting.
  # If `null`, the timezone will default to UTC and can be set imperatively using `timedatectl`.
  time.timeZone = "Europe/Moscow";


  location = {
    # The location provider to use for determining your location.
    # If set to `manual` you must also provide latitude/longitude.
    provider = "manual"; # one of "manual", "geoclue2"

    # Your current latitude, between `-90.0` and `90.0`.
    # Must be provided along with longitude.
    latitude = 55.75;

    # Your current longitude, between between `-180.0` and `180.0`.
    # Must be provided along with latitude.
    longitude = 37.61;
  };
}
