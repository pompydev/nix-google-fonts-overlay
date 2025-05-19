{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akatab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akatab/Akatab-Regular.ttf?raw=true";
      name = "Akatab-Regular.ttf";
      sha256 = "7efecab54eb02e1b47087ec1ebbe6ac32b4308ac02e18f71c1f7567ec4d69fb4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akatab/Akatab-Medium.ttf?raw=true";
      name = "Akatab-Medium.ttf";
      sha256 = "e0ce76da55ce20a8ae5159efcca7cfe9ab01749d8338d6a8c47b7415c166aa52";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akatab/Akatab-SemiBold.ttf?raw=true";
      name = "Akatab-SemiBold.ttf";
      sha256 = "e5a581ce73fa4ead0fc5129c330033f042ab3fcc08475ea38cdeb03efa3bc0c8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akatab/Akatab-Bold.ttf?raw=true";
      name = "Akatab-Bold.ttf";
      sha256 = "d7bf342248fa07fcc0e3aeb186f1f9286e10c8465ee427dd74776c3ba1a10fab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akatab/Akatab-ExtraBold.ttf?raw=true";
      name = "Akatab-ExtraBold.ttf";
      sha256 = "d56e1275568d4a88d66ce20fb7987d3adb90cafac1976a941b756719e753e58f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akatab/Akatab-Black.ttf?raw=true";
      name = "Akatab-Black.ttf";
      sha256 = "31ddec2b9ed113d6003368ca61efe3707df5e93804f337aca6d5d24a1f2700e1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Akatab-Regular.ttf $out/share/fonts/truetype/Akatab-Regular.ttf
     install -Dm644 Akatab-Medium.ttf $out/share/fonts/truetype/Akatab-Medium.ttf
     install -Dm644 Akatab-SemiBold.ttf $out/share/fonts/truetype/Akatab-SemiBold.ttf
     install -Dm644 Akatab-Bold.ttf $out/share/fonts/truetype/Akatab-Bold.ttf
     install -Dm644 Akatab-ExtraBold.ttf $out/share/fonts/truetype/Akatab-ExtraBold.ttf
     install -Dm644 Akatab-Black.ttf $out/share/fonts/truetype/Akatab-Black.ttf
  '';

  meta = with lib; {
    description = "Akatab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
