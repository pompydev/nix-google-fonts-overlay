{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "estonia-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/estonia/Estonia-Regular.ttf?raw=true";
      name = "Estonia-Regular.ttf";
      sha256 = "03087597ea24879c19d51ca4622f8c4e9cd867d081e7ad0ad3e7dccfdb1933b2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Estonia-Regular.ttf $out/share/fonts/truetype/Estonia-Regular.ttf
  '';

  meta = with lib; {
    description = "Estonia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
