{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inika-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inika/Inika-Regular.ttf?raw=true";
      name = "Inika-Regular.ttf";
      sha256 = "3fe94a6697ababc3b8b580e005d2718a2ce0fe2afea08b164ee5259d9ea8db25";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inika/Inika-Bold.ttf?raw=true";
      name = "Inika-Bold.ttf";
      sha256 = "57c5b398a0d72c85283a4640337091bc974aae9ef03b1bd159523b747c1197f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inika-Regular.ttf $out/share/fonts/truetype/Inika-Regular.ttf
     install -Dm644 Inika-Bold.ttf $out/share/fonts/truetype/Inika-Bold.ttf
  '';

  meta = with lib; {
    description = "Inika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
