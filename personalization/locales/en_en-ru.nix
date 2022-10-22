{ config, lib, ... }:

{
  # Select internationalisation properties:
  i18n = {
    # The default locale.
    # It determines the language for program messages,
    # the format for dates and times, sort order, and so on.
    # It also determines the character set, such as UTF-8.
    defaultLocale = "en_US.UTF-8";


    # List of locales that the system should support.
    # The value "all" means that all locales supported by Glibc will be installed.
    # A full list of supported locales can be found
    # at `https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/SUPPORTED`.
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
  };
}
