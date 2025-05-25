{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-multani-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmultani/NotoSansMultani-Regular.ttf?raw=true";
      name = "NotoSansMultani-Regular.ttf";
      sha256 = "fe39d78a4f0acae8e5033ac59aa7af3f8664410c048a3b58b5d76ea44548c090";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMultani-Regular.ttf $out/share/fonts/truetype/NotoSansMultani-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Multani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
