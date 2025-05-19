{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "seymour-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/seymourone/SeymourOne-Regular.ttf?raw=true";
      name = "SeymourOne-Regular.ttf";
      sha256 = "8699709245074a91a64b43495bf864f6df6d43648d7e9d0d09144ca74433c3d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SeymourOne-Regular.ttf $out/share/fonts/truetype/SeymourOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Seymour One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
