{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "denk-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/denkone/DenkOne-Regular.ttf?raw=true";
      name = "DenkOne-Regular.ttf";
      sha256 = "088761eca739820556435bd4eafb8637808a55e121bed582d493969525c97211";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DenkOne-Regular.ttf $out/share/fonts/truetype/DenkOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Denk One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
