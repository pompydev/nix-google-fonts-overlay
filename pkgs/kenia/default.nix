{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kenia-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kenia/Kenia-Regular.ttf?raw=true";
      name = "Kenia-Regular.ttf";
      sha256 = "4052e03cdabd35ef9f739fdf1462b1b26c16b2238ba27223238624a2bb5565b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kenia-Regular.ttf $out/share/fonts/truetype/Kenia-Regular.ttf
  '';

  meta = with lib; {
    description = "Kenia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
