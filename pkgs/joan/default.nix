{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "joan-${version}";
  version = "2022-04-28-101127";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ddb8daa287281964b825109da0cde122d72e8f1/ofl/joan/Joan-Regular.ttf?raw=true";
      name = "Joan-Regular.ttf";
      sha256 = "e89462572e11a18b80d29826dcf3fb7debba8b2e0d20d0cff50d45c1e5cdf266";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Joan-Regular.ttf $out/share/fonts/truetype/Joan-Regular.ttf
  '';

  meta = with lib; {
    description = "Joan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
