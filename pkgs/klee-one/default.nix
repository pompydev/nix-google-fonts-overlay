{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "klee-one-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a881eac792f94326957e5796541b99ac9e434a52/ofl/kleeone/KleeOne-Regular.ttf?raw=true";
      name = "KleeOne-Regular.ttf";
      sha256 = "bf4063f030cc2ae6adf0a11424a1888e5c0eb4438f1f6d02f52294af868e9b3a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a881eac792f94326957e5796541b99ac9e434a52/ofl/kleeone/KleeOne-SemiBold.ttf?raw=true";
      name = "KleeOne-SemiBold.ttf";
      sha256 = "b031ec426c23ca1143ef1f7d58bee7a79efe119ed654152f121c922202b303fd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KleeOne-Regular.ttf $out/share/fonts/truetype/KleeOne-Regular.ttf
     install -Dm644 KleeOne-SemiBold.ttf $out/share/fonts/truetype/KleeOne-SemiBold.ttf
  '';

  meta = with lib; {
    description = "Klee One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
