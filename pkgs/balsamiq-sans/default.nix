{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "balsamiq-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaef391e69a0c330d907a3fab7c19fc573c346e/ofl/balsamiqsans/BalsamiqSans-Regular.ttf?raw=true";
      name = "BalsamiqSans-Regular.ttf";
      sha256 = "2ab10a6a2c91fe13934877d7590abcaf90d1458c54e64e988304b6c9ace8d48d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaef391e69a0c330d907a3fab7c19fc573c346e/ofl/balsamiqsans/BalsamiqSans-Italic.ttf?raw=true";
      name = "BalsamiqSans-Italic.ttf";
      sha256 = "b9f3b9fddbacf8ad031a340943014078b0c9ea60288c214340aa6ed4798099a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaef391e69a0c330d907a3fab7c19fc573c346e/ofl/balsamiqsans/BalsamiqSans-Bold.ttf?raw=true";
      name = "BalsamiqSans-Bold.ttf";
      sha256 = "ed75cc3d6d0d478ce55e598ebbfc766248883d457d1074b996239d5b0d2af658";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaef391e69a0c330d907a3fab7c19fc573c346e/ofl/balsamiqsans/BalsamiqSans-BoldItalic.ttf?raw=true";
      name = "BalsamiqSans-BoldItalic.ttf";
      sha256 = "0ef14892b6e44585594a711daa588ba79f7b767ecf0f3f6559d38f6a1635917f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalsamiqSans-Regular.ttf $out/share/fonts/truetype/BalsamiqSans-Regular.ttf
     install -Dm644 BalsamiqSans-Italic.ttf $out/share/fonts/truetype/BalsamiqSans-Italic.ttf
     install -Dm644 BalsamiqSans-Bold.ttf $out/share/fonts/truetype/BalsamiqSans-Bold.ttf
     install -Dm644 BalsamiqSans-BoldItalic.ttf $out/share/fonts/truetype/BalsamiqSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Balsamiq Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
