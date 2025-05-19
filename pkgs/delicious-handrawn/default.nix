{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "delicious-handrawn-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/delicioushandrawn/DeliciousHandrawn-Regular.ttf?raw=true";
      name = "DeliciousHandrawn-Regular.ttf";
      sha256 = "5b78da9362d2018cab40ba93565f7a0134723f6a5ee4e3432726d45473a51277";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DeliciousHandrawn-Regular.ttf $out/share/fonts/truetype/DeliciousHandrawn-Regular.ttf
  '';

  meta = with lib; {
    description = "Delicious Handrawn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
