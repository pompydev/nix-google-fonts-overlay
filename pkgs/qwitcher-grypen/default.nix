{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "qwitcher-grypen-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b723da0e90820ac7fc4551eb70e7d1d5b6b5eb3d/ofl/qwitchergrypen/QwitcherGrypen-Regular.ttf?raw=true";
      name = "QwitcherGrypen-Regular.ttf";
      sha256 = "54f877a938c45e55f44344a6fe143f83f60cedbc653dc2e318617a9df97e964e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b723da0e90820ac7fc4551eb70e7d1d5b6b5eb3d/ofl/qwitchergrypen/QwitcherGrypen-Bold.ttf?raw=true";
      name = "QwitcherGrypen-Bold.ttf";
      sha256 = "a48354aa42dca6dfaf16700b453d03c73ef34e6168b05c100edd7b957eb3add7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 QwitcherGrypen-Regular.ttf $out/share/fonts/truetype/QwitcherGrypen-Regular.ttf
     install -Dm644 QwitcherGrypen-Bold.ttf $out/share/fonts/truetype/QwitcherGrypen-Bold.ttf
  '';

  meta = with lib; {
    description = "Qwitcher Grypen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
