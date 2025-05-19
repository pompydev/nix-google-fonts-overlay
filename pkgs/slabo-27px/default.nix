{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "slabo-27px-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/slabo27px/Slabo27px-Regular.ttf?raw=true";
      name = "Slabo27px-Regular.ttf";
      sha256 = "7615a9e35725401d89c0fb02a96cbce43b49efada51b181d74049ac8d49d4b55";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Slabo27px-Regular.ttf $out/share/fonts/truetype/Slabo27px-Regular.ttf
  '';

  meta = with lib; {
    description = "Slabo 27px";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
