{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-siddham-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssiddham/NotoSansSiddham-Regular.ttf?raw=true";
      name = "NotoSansSiddham-Regular.ttf";
      sha256 = "8ae4c893d5df6a4e418e7cd19ad6cc7fb95c7b9e04a772072a102fca74ca0185";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSiddham-Regular.ttf $out/share/fonts/truetype/NotoSansSiddham-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Siddham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
