{ config, lib, ... }:

{
  # The time zone used when displaying times and dates.
  # See `https://en.wikipedia.org/wiki/List_of_tz_database_time_zones`
  # for a comprehensive list of possible values for this setting.
  # If `null`, the timezone will default to UTC and can be set imperatively using `timedatectl`.
  time.timeZone = null;
}
