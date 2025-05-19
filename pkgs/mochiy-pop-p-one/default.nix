{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mochiy-pop-p-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mochiypoppone/MochiyPopPOne-Regular.ttf?raw=true";
      name = "MochiyPopPOne-Regular.ttf";
      sha256 = "0031243aa1290c63c7551f8cdf06b1631a5c72033d12b2b7c595e60660007252";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MochiyPopPOne-Regular.ttf $out/share/fonts/truetype/MochiyPopPOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Mochiy Pop P One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
