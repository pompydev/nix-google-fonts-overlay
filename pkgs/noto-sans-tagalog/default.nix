{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tagalog-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanstagalog/NotoSansTagalog-Regular.ttf?raw=true";
      name = "NotoSansTagalog-Regular.ttf";
      sha256 = "871a66319d10d1a027eee889f75ea49be0b7d2a4e97acd6bf7f7a0ed1d741aac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTagalog-Regular.ttf $out/share/fonts/truetype/NotoSansTagalog-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tagalog";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
