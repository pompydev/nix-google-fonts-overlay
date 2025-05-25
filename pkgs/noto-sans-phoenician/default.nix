{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-phoenician-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansphoenician/NotoSansPhoenician-Regular.ttf?raw=true";
      name = "NotoSansPhoenician-Regular.ttf";
      sha256 = "9c248001ff674977172c89fb7686faf22b827b63641d0122352523f31780d1f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPhoenician-Regular.ttf $out/share/fonts/truetype/NotoSansPhoenician-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Phoenician";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
