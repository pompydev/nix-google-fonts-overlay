{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "splash-${version}";
  version = "2022-05-25-094458";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/41264e5dd761490dfe18aa647f791ca328135019/ofl/splash/Splash-Regular.ttf?raw=true";
      name = "Splash-Regular.ttf";
      sha256 = "42c2ddc11917333bcd24a3eb0bc7df5205278226e2f6521459384479f1b6675c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Splash-Regular.ttf $out/share/fonts/truetype/Splash-Regular.ttf
  '';

  meta = with lib; {
    description = "Splash";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
