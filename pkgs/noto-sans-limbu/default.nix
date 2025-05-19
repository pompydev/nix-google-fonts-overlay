{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-limbu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanslimbu/NotoSansLimbu-Regular.ttf?raw=true";
      name = "NotoSansLimbu-Regular.ttf";
      sha256 = "5a8b4fd72c5a64051332f66fcf46fda1a32a37d130631362378c6b465d852dd5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLimbu-Regular.ttf $out/share/fonts/truetype/NotoSansLimbu-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Limbu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
