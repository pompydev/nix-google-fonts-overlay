{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marck-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/marckscript/MarckScript-Regular.ttf?raw=true";
      name = "MarckScript-Regular.ttf";
      sha256 = "504de8cc6f919163bc9afb67b9bc208d258230c5e8d00cb82ec52474f9fafc3b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MarckScript-Regular.ttf $out/share/fonts/truetype/MarckScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Marck Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
