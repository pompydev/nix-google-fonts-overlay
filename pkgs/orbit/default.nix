{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orbit-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/orbit/Orbit-Regular.ttf?raw=true";
      name = "Orbit-Regular.ttf";
      sha256 = "5d0206fb0a9e3eeac51aff8d4a6dbb7613d63fc435f1a51f96dc35cefb5f9f87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Orbit-Regular.ttf $out/share/fonts/truetype/Orbit-Regular.ttf
  '';

  meta = with lib; {
    description = "Orbit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
