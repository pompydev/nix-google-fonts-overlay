{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "otomanopee-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/otomanopeeone/OtomanopeeOne-Regular.ttf?raw=true";
      name = "OtomanopeeOne-Regular.ttf";
      sha256 = "1c10207fafb5eae7c7b85554724653e3c3718a453db31d9fa55dfb1872ccc523";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OtomanopeeOne-Regular.ttf $out/share/fonts/truetype/OtomanopeeOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Otomanopee One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
