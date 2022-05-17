{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fraunces-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ac502d8eff76ef4d9477cdcc8ef7d0c84fde5372/ofl/fraunces/Fraunces%5BSOFT,WONK,opsz,wght%5D.ttf?raw=true";
      name = "Fraunces_SOFT,WONK,opsz,wght_.ttf";
      sha256 = "177ff6c0f14e5550a3c624247cd1189611d4eb65d000b14944c63d967958abbb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ac502d8eff76ef4d9477cdcc8ef7d0c84fde5372/ofl/fraunces/Fraunces-Italic%5BSOFT,WONK,opsz,wght%5D.ttf?raw=true";
      name = "Fraunces-Italic_SOFT,WONK,opsz,wght_.ttf";
      sha256 = "b24448c43702fac4ee856781d461a0dfba8d8e594b6e8e190234b75fed2c0e01";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fraunces_SOFT,WONK,opsz,wght_.ttf $out/share/fonts/truetype/Fraunces_SOFT,WONK,opsz,wght_.ttf
     install -Dm644 Fraunces-Italic_SOFT,WONK,opsz,wght_.ttf $out/share/fonts/truetype/Fraunces-Italic_SOFT,WONK,opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Fraunces";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
