{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mingzat-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mingzat/Mingzat-Regular.ttf?raw=true";
      name = "Mingzat-Regular.ttf";
      sha256 = "63b8c9ea9ceb9953a6aeaf94e70be3d534c93070247c945512c1e782dace961a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mingzat-Regular.ttf $out/share/fonts/truetype/Mingzat-Regular.ttf
  '';

  meta = with lib; {
    description = "Mingzat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
