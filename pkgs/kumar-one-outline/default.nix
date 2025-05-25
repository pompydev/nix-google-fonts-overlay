{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kumar-one-outline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kumaroneoutline/KumarOneOutline-Regular.ttf?raw=true";
      name = "KumarOneOutline-Regular.ttf";
      sha256 = "571c34cfa9c533f34de71081ddc7c7593d244d183a6114b8bac1a83a59e2f7ed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KumarOneOutline-Regular.ttf $out/share/fonts/truetype/KumarOneOutline-Regular.ttf
  '';

  meta = with lib; {
    description = "Kumar One Outline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
