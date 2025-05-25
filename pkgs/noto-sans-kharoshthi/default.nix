{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kharoshthi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanskharoshthi/NotoSansKharoshthi-Regular.ttf?raw=true";
      name = "NotoSansKharoshthi-Regular.ttf";
      sha256 = "e1cc4bd5abc3c0efe6cb102a30b543371c8a42d12ed661bcc4c3f3e3421ee670";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKharoshthi-Regular.ttf $out/share/fonts/truetype/NotoSansKharoshthi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kharoshthi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
