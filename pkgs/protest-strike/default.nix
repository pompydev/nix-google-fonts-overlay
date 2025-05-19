{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "protest-strike-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/proteststrike/ProtestStrike-Regular.ttf?raw=true";
      name = "ProtestStrike-Regular.ttf";
      sha256 = "0dcfbc041d0c134681f93615cdcc5725eeb36854b2eb115b54421a9551840197";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProtestStrike-Regular.ttf $out/share/fonts/truetype/ProtestStrike-Regular.ttf
  '';

  meta = with lib; {
    description = "Protest Strike";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
