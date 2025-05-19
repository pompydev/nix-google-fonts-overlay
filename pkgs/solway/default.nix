{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "solway-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/solway/Solway-Light.ttf?raw=true";
      name = "Solway-Light.ttf";
      sha256 = "7d5819ffda578c61363779789aa23ad26285a44472743a8ab30e17df15c88033";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/solway/Solway-Regular.ttf?raw=true";
      name = "Solway-Regular.ttf";
      sha256 = "a7a5103509a64884149b94b500003d3deecc289cb94f2556c81945ca28b0da55";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/solway/Solway-Medium.ttf?raw=true";
      name = "Solway-Medium.ttf";
      sha256 = "3c47643b4b48c825e65e44af9356bb7392ee63c7c4e7211e6f8d1e1b96b633f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/solway/Solway-Bold.ttf?raw=true";
      name = "Solway-Bold.ttf";
      sha256 = "1929aeae0836799a08472026aff797a768f1c051db629a853d35589ba5e5ae1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/solway/Solway-ExtraBold.ttf?raw=true";
      name = "Solway-ExtraBold.ttf";
      sha256 = "4d2a7458d613ba3316cd9c1cb7a1ac89daecc34c73aed100d72c5170db1a86d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Solway-Light.ttf $out/share/fonts/truetype/Solway-Light.ttf
     install -Dm644 Solway-Regular.ttf $out/share/fonts/truetype/Solway-Regular.ttf
     install -Dm644 Solway-Medium.ttf $out/share/fonts/truetype/Solway-Medium.ttf
     install -Dm644 Solway-Bold.ttf $out/share/fonts/truetype/Solway-Bold.ttf
     install -Dm644 Solway-ExtraBold.ttf $out/share/fonts/truetype/Solway-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Solway";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
