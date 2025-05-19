{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rammetto-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rammettoone/RammettoOne-Regular.ttf?raw=true";
      name = "RammettoOne-Regular.ttf";
      sha256 = "0063c5480f7868be5dd95dd668575643ff953199541dce65fe5a88310bd7733f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RammettoOne-Regular.ttf $out/share/fonts/truetype/RammettoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Rammetto One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
