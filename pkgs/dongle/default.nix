{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dongle-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/388be86af3f1ba315e505752b4e26ca1078b712a/ofl/dongle/Dongle-Light.ttf?raw=true";
      name = "Dongle-Light.ttf";
      sha256 = "bb04e03dbe44fb0c619434f31565e62b5bac67229d5ed72eeac69c2e74e9a45c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/388be86af3f1ba315e505752b4e26ca1078b712a/ofl/dongle/Dongle-Regular.ttf?raw=true";
      name = "Dongle-Regular.ttf";
      sha256 = "2966e7a9d312a868e2b5477bf9a3e59b8ce16beb76e7e52305ab5897d1ce9741";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/388be86af3f1ba315e505752b4e26ca1078b712a/ofl/dongle/Dongle-Bold.ttf?raw=true";
      name = "Dongle-Bold.ttf";
      sha256 = "944c498c0d1a1832ab36f173b1b3aa5ae77b2a914e00c4d79e05338fae36472d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dongle-Light.ttf $out/share/fonts/truetype/Dongle-Light.ttf
     install -Dm644 Dongle-Regular.ttf $out/share/fonts/truetype/Dongle-Regular.ttf
     install -Dm644 Dongle-Bold.ttf $out/share/fonts/truetype/Dongle-Bold.ttf
  '';

  meta = with lib; {
    description = "Dongle";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
