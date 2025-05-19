{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fragment-mono-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fragmentmonosc/FragmentMonoSC-Regular.ttf?raw=true";
      name = "FragmentMonoSC-Regular.ttf";
      sha256 = "7e6330281d72478a0eebc3a7a2f0dfb8fb14e5122fae310a70b9118d99012fc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fragmentmonosc/FragmentMonoSC-Italic.ttf?raw=true";
      name = "FragmentMonoSC-Italic.ttf";
      sha256 = "b9dbc7536071741814bf996e88fb7ab9e77dd0746634b63534888269033dee35";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FragmentMonoSC-Regular.ttf $out/share/fonts/truetype/FragmentMonoSC-Regular.ttf
     install -Dm644 FragmentMonoSC-Italic.ttf $out/share/fonts/truetype/FragmentMonoSC-Italic.ttf
  '';

  meta = with lib; {
    description = "Fragment Mono SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
