{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "belanosima-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/belanosima/Belanosima-Regular.ttf?raw=true";
      name = "Belanosima-Regular.ttf";
      sha256 = "fe5f8af7696a801accff91511c4feecb51bc49516465a5557af3b0593c67685c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/belanosima/Belanosima-SemiBold.ttf?raw=true";
      name = "Belanosima-SemiBold.ttf";
      sha256 = "2394d701ecaede7bdcfb01906a4cfccd7d72108c7e66e41be6419dae7d8811ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/belanosima/Belanosima-Bold.ttf?raw=true";
      name = "Belanosima-Bold.ttf";
      sha256 = "ff3fc9341c07ee4260b9f060d4b66b34f2b13d88a6798ac4ad3c8920a0dbc9b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Belanosima-Regular.ttf $out/share/fonts/truetype/Belanosima-Regular.ttf
     install -Dm644 Belanosima-SemiBold.ttf $out/share/fonts/truetype/Belanosima-SemiBold.ttf
     install -Dm644 Belanosima-Bold.ttf $out/share/fonts/truetype/Belanosima-Bold.ttf
  '';

  meta = with lib; {
    description = "Belanosima";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
