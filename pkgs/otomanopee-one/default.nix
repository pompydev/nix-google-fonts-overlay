{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "otomanopee-one-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e57fc4e6dc99bf9b6e0c32e4fe952e02c46361e9/ofl/otomanopeeone/OtomanopeeOne-Regular.ttf?raw=true";
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
