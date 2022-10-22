{ config, lib, ... }:

{
  # Whether to install files to support
  # the XDG Shared MIME-info specification
  # and the XDG MIME Applications specification.
  xdg.mime.enable = true;


  # Sets the default applications for given mimetypes.
  #
  # `nano /run/current-system/sw/share/applications/mimeinfo.cache`
  #
  xdg.mime.defaultApplications = {
    inode/directory = [ "pcmanfm-qt.desktop" ];


    application/epub+zip = [ "okularApplication_epub.desktop" ];
    application/javascript = [ "org.kde.kate.desktop" ];
    application/json = [ "org.kde.kate.desktop" ];

    application/pdf = [
      "okularApplication_pdf.desktop"
      "firefox.desktop"
      "chromium-browser.desktop"
    ];

    application/x-archive = [ "lxqt-archiver.desktop" ];
    application/x-bittorrent = [ "transmission-qt.desktop" ];
    application/x-cb7 = [ "okularApplication_comicbook.desktop" ];
    application/x-cbr = [ "okularApplication_comicbook.desktop" ];
    application/x-cbt = [ "okularApplication_comicbook.desktop" ];
    application/x-cbz = [ "okularApplication_comicbook.desktop" ];
    application/x-chm = [ "okularApplication_chm.desktop" ];
    application/x-dvi = [ "okularApplication_dvi.desktop" ];
    application/x-extension-htm = [ "firefox.desktop" "chromium-browser.desktop" ];
    application/x-extension-html = [ "firefox.desktop" "chromium-browser.desktop" ];
    application/x-extension-m4a = [ "mpv.desktop" "umpv.desktop" ];
    application/x-extension-mp4 = [ "mpv.desktop" "umpv.desktop" ];
    application/x-fictionbook+xml = [ "okularApplication_fb.desktop" ];
    application/x-extension-shtml = [ "firefox.desktop" ];
    application/x-extension-xhtml = [ "firefox.desktop" "chromium-browser.desktop" ];
    application/x-extension-xht = [ "firefox.desktop" ];
    application/x-keepass2 = [ "org.keepassxc.KeePassXC.desktop" ];
    application/x-matroska = [ "mpv.desktop" "umpv.desktop" ];
    application/x-mobipocket-ebook = [ "okularApplication_mobi.desktop" ];
    application/x-ogg = [ "mpv.desktop" "umpv.desktop" ];
    application/x-rar = [ "lxqt-archiver.desktop" ];
    application/x-tar = [ "lxqt-archiver.desktop" ];
    application/x-wwf = [ "okularApplication_pdf.desktop" ];
    application/x-yaml = [ "org.kde.kate.desktop" ];
    application/x-zip = [ "lxqt-archiver.desktop" ];

    application/xhtml+xml = [ "firefox.desktop" "chromium-browser.desktop" ];
    application/xml = [ "firefox.desktop" "chromium-browser.desktop" ];
    application/zip = [ "lxqt-archiver.desktop" ];


    audio/flac = [ "mpv.desktop" "umpv.desktop" ];
    audio/mp3 = [ "mpv.desktop" "umpv.desktop" ];
    audio/mpeg = [ "mpv.desktop" "umpv.desktop" ];
    audio/ogg = [ "mpv.desktop" "umpv.desktop" ];
    audio/wav = [ "mpv.desktop" "umpv.desktop" ];
    audio/webm = [ "mpv.desktop" "umpv.desktop" ];


    image/avif = [ "qimgv.desktop" ];
    image/bmp = [ "qimgv.desktop" "feh.desktop" ];
    image/gif = [ "qimgv.desktop" ];
    image/jpeg = [ "qimgv.desktop" "feh.desktop" ];
    image/jxl = [ "qimgv.desktop" ];
    image/png = [ "qimgv.desktop" "feh.desktop" ];
    image/svg+xml = [ "qimgv.desktop" ];
    image/svg-xml = [ "qimgv.desktop" ];
    image/tiff = [ "qimgv.desktop" ];
    image/vnd.djvu = [ "okularApplication_djvu.desktop" ];
    image/webp = [ "qimgv.desktop" ];


    text/css = [ "org.kde.kate.desktop" ];

    text/html = [
      "firefox.desktop"
      "chromium-browser.desktop"
      "org.kde.kate.desktop"
    ];

    text/ini = [ "org.kde.kate.desktop" ];
    text/markdown = [ "okularApplication_md.desktop" "org.kde.kate.desktop" ];
    text/plain = [ "org.kde.kate.desktop" ];
    text/rtf = [ "org.kde.kate.desktop" ];

    text/xml = [
      "firefox.desktop"
      "chromium-browser.desktop"
      "org.kde.kate.desktop"
    ];


    video/avi = [ "mpv.desktop" "umpv.desktop" ];
    video/flv = [ "mpv.desktop" "umpv.desktop" ];
    video/mkv = [ "mpv.desktop" "umpv.desktop" ];
    video/mp4 = [ "mpv.desktop" "umpv.desktop" ];
    video/mpeg = [ "mpv.desktop" "umpv.desktop" ];

    video/x-matroska = [ "mpv.desktop" "umpv.desktop" ];
    
    video/webm = [
      "mpv.desktop"
      "umpv.desktop"
      "qimgv.desktop"
    ];


    x-scheme-handler/about = [ "firefox.desktop" "chromium-browser.desktop" ];
    x-scheme-handler/ftp = [ "firefox.desktop" "chromium-browser.desktop" ];
    x-scheme-handler/http = [ "firefox.desktop" "chromium-browser.desktop" ];
    x-scheme-handler/https = [ "firefox.desktop" "chromium-browser.desktop" ];
    x-scheme-handler/magnet = [ "transmission-qt.desktop" ];
    x-scheme-handler/mailto = [ "firefox.desktop" "chromium-browser.desktop" ];
    x-scheme-handler/tg = [ "telegramdesktop.desktop" ];
    x-scheme-handler/unknown = [ "firefox.desktop" "chromium-browser.desktop" ];
  };
}
