{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tagalog-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstagalog/NotoSansTagalog-Regular.ttf?raw=true";
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
