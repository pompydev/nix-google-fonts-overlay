{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "short-stack-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/shortstack/ShortStack-Regular.ttf?raw=true";
      name = "ShortStack-Regular.ttf";
      sha256 = "9f0e16e8683b2dce66edd7c3340362b554326739fbac594cabc1e9442cf5e8cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShortStack-Regular.ttf $out/share/fonts/truetype/ShortStack-Regular.ttf
  '';

  meta = with lib; {
    description = "Short Stack";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
