{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "elsie-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/elsie/Elsie-Regular.ttf?raw=true";
      name = "Elsie-Regular.ttf";
      sha256 = "9b3ff5056866667fb29f60beb4522994afdd4d5f580626c6fd9e6f5bf49f1ea5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/elsie/Elsie-Black.ttf?raw=true";
      name = "Elsie-Black.ttf";
      sha256 = "69339fcd10a5d5c12b72cf5127b44be5a0147d2531baf494004c7adad4af6338";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Elsie-Regular.ttf $out/share/fonts/truetype/Elsie-Regular.ttf
     install -Dm644 Elsie-Black.ttf $out/share/fonts/truetype/Elsie-Black.ttf
  '';

  meta = with lib; {
    description = "Elsie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
