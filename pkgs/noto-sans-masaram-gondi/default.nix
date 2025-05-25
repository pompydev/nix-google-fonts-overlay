{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-masaram-gondi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmasaramgondi/NotoSansMasaramGondi-Regular.ttf?raw=true";
      name = "NotoSansMasaramGondi-Regular.ttf";
      sha256 = "e1caa285f93023d2cdf8e9594310062b8310a3d6addf6b56103a9f828198c98f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMasaramGondi-Regular.ttf $out/share/fonts/truetype/NotoSansMasaramGondi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Masaram Gondi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
