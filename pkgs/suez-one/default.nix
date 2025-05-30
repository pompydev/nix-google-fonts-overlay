{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suez-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/suezone/SuezOne-Regular.ttf?raw=true";
      name = "SuezOne-Regular.ttf";
      sha256 = "3ef86844aad0cf9db7dcbda326f3d2f54cc4ccfe56db949e9e0c60a17031bd41";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SuezOne-Regular.ttf $out/share/fonts/truetype/SuezOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Suez One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
