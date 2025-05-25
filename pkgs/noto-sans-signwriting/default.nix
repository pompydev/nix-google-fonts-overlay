{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-signwriting-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssignwriting/NotoSansSignWriting-Regular.ttf?raw=true";
      name = "NotoSansSignWriting-Regular.ttf";
      sha256 = "1da27fe7b8e959efaf338818f2a6c1aa2c02ff97cf60c34c6d0825675ebc53fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSignWriting-Regular.ttf $out/share/fonts/truetype/NotoSansSignWriting-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans SignWriting";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
