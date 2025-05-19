{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quintessential-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/quintessential/Quintessential-Regular.ttf?raw=true";
      name = "Quintessential-Regular.ttf";
      sha256 = "73d192f10dbfc716214aae282afb93036f12415d16adc9d6d0e981f34d829d32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quintessential-Regular.ttf $out/share/fonts/truetype/Quintessential-Regular.ttf
  '';

  meta = with lib; {
    description = "Quintessential";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
