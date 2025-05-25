{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-linear-a-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslineara/NotoSansLinearA-Regular.ttf?raw=true";
      name = "NotoSansLinearA-Regular.ttf";
      sha256 = "f2f281d2bfd685ed2fb9597d77ed50dbe64bc36e0e80acf88b0862f2561e5aa0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLinearA-Regular.ttf $out/share/fonts/truetype/NotoSansLinearA-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Linear A";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
