{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ballet-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ballet/Ballet%5Bopsz%5D.ttf?raw=true";
      name = "Ballet_opsz_.ttf";
      sha256 = "6500b6abb6dd31c3389e8f32a21ae3c66e3257d0afefecf7688aa23f742cb677";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ballet_opsz_.ttf $out/share/fonts/truetype/Ballet_opsz_.ttf
  '';

  meta = with lib; {
    description = "Ballet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
