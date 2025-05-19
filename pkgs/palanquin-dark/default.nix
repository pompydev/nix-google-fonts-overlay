{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "palanquin-dark-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquindark/PalanquinDark-Regular.ttf?raw=true";
      name = "PalanquinDark-Regular.ttf";
      sha256 = "de7ba10d7038f13c677b6a57e01c4b2082dd49602a15406135d761296c949284";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquindark/PalanquinDark-Medium.ttf?raw=true";
      name = "PalanquinDark-Medium.ttf";
      sha256 = "32b2f0672eb1597556c71d002b59dbaff75aeb20e3d2fde9286c71b3793b483f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquindark/PalanquinDark-SemiBold.ttf?raw=true";
      name = "PalanquinDark-SemiBold.ttf";
      sha256 = "4729ae4e60cc20cbc1ec942b033354683339fd77a9dcf55f998e9153cb6d3036";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquindark/PalanquinDark-Bold.ttf?raw=true";
      name = "PalanquinDark-Bold.ttf";
      sha256 = "8bf3591c758a3a35977b9af72c6a9639aa60c6652743ddb9cdc59dc1a30f7971";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PalanquinDark-Regular.ttf $out/share/fonts/truetype/PalanquinDark-Regular.ttf
     install -Dm644 PalanquinDark-Medium.ttf $out/share/fonts/truetype/PalanquinDark-Medium.ttf
     install -Dm644 PalanquinDark-SemiBold.ttf $out/share/fonts/truetype/PalanquinDark-SemiBold.ttf
     install -Dm644 PalanquinDark-Bold.ttf $out/share/fonts/truetype/PalanquinDark-Bold.ttf
  '';

  meta = with lib; {
    description = "Palanquin Dark";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
