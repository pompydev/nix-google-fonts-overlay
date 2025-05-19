{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "slabo-13px-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/slabo13px/Slabo13px-Regular.ttf?raw=true";
      name = "Slabo13px-Regular.ttf";
      sha256 = "7b86edc3c9605f9e0d997658735b75ae1d5e11606a9109b8cc99521eb2b3f406";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Slabo13px-Regular.ttf $out/share/fonts/truetype/Slabo13px-Regular.ttf
  '';

  meta = with lib; {
    description = "Slabo 13px";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
