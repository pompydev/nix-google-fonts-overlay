{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mountains-of-christmas-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/mountainsofchristmas/MountainsofChristmas-Regular.ttf?raw=true";
      name = "MountainsofChristmas-Regular.ttf";
      sha256 = "3855303be6b88707c00bb271f9c95e996605e9a8e656b3a30686862352b1052e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/mountainsofchristmas/MountainsofChristmas-Bold.ttf?raw=true";
      name = "MountainsofChristmas-Bold.ttf";
      sha256 = "4c6126f43c650c81d236fd04ffc2fccbc3f37438c304cafad6894a835c2250ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MountainsofChristmas-Regular.ttf $out/share/fonts/truetype/MountainsofChristmas-Regular.ttf
     install -Dm644 MountainsofChristmas-Bold.ttf $out/share/fonts/truetype/MountainsofChristmas-Bold.ttf
  '';

  meta = with lib; {
    description = "Mountains of Christmas";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
