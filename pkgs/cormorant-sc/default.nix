{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantsc/CormorantSC-Light.ttf?raw=true";
      name = "CormorantSC-Light.ttf";
      sha256 = "d3dfcbf1aa9281743cb123292851862b4419602efbf29c4867e680d53774a2ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantsc/CormorantSC-Regular.ttf?raw=true";
      name = "CormorantSC-Regular.ttf";
      sha256 = "a51985a075f3884d8dc9b2d20367c51b6b05e53fdb912959acb785084579aeaa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantsc/CormorantSC-Medium.ttf?raw=true";
      name = "CormorantSC-Medium.ttf";
      sha256 = "7ec02e6b6c20697fd8d5038349452b6f3c628c16440a04156650d42e3fef89bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantsc/CormorantSC-SemiBold.ttf?raw=true";
      name = "CormorantSC-SemiBold.ttf";
      sha256 = "648cd1c932871e4e8e1d147b593315409e8ea82282f88e9397e2cceae83d065b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantsc/CormorantSC-Bold.ttf?raw=true";
      name = "CormorantSC-Bold.ttf";
      sha256 = "78f70c79b5c0a1e66641d4b4a2e2ed32e1a45774b3de94e56f8de68510219177";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantSC-Light.ttf $out/share/fonts/truetype/CormorantSC-Light.ttf
     install -Dm644 CormorantSC-Regular.ttf $out/share/fonts/truetype/CormorantSC-Regular.ttf
     install -Dm644 CormorantSC-Medium.ttf $out/share/fonts/truetype/CormorantSC-Medium.ttf
     install -Dm644 CormorantSC-SemiBold.ttf $out/share/fonts/truetype/CormorantSC-SemiBold.ttf
     install -Dm644 CormorantSC-Bold.ttf $out/share/fonts/truetype/CormorantSC-Bold.ttf
  '';

  meta = with lib; {
    description = "Cormorant SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
