{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-old-mincho-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenoldmincho/ZenOldMincho-Regular.ttf?raw=true";
      name = "ZenOldMincho-Regular.ttf";
      sha256 = "4c051a78a21c4e8e9dccf1c754776d33f356b8cc6ef95d9b64761b9bae814b84";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenoldmincho/ZenOldMincho-Medium.ttf?raw=true";
      name = "ZenOldMincho-Medium.ttf";
      sha256 = "e60c7961e5110d0f08f902de43fe60865f1538845ff2092c779837257efac3bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenoldmincho/ZenOldMincho-SemiBold.ttf?raw=true";
      name = "ZenOldMincho-SemiBold.ttf";
      sha256 = "d98b9783652081f7f9e662b0568bddeaf6462962dd39edf68781268eb60ea3a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenoldmincho/ZenOldMincho-Bold.ttf?raw=true";
      name = "ZenOldMincho-Bold.ttf";
      sha256 = "d6b95c1ff45c8dac153d28961e4c37d7d03b648330c71f884d124dc652a13c0d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenoldmincho/ZenOldMincho-Black.ttf?raw=true";
      name = "ZenOldMincho-Black.ttf";
      sha256 = "84a80d8bca79d7d9478935045b216ed003ad40fdea5fd9116d524eb26e872cdc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenOldMincho-Regular.ttf $out/share/fonts/truetype/ZenOldMincho-Regular.ttf
     install -Dm644 ZenOldMincho-Medium.ttf $out/share/fonts/truetype/ZenOldMincho-Medium.ttf
     install -Dm644 ZenOldMincho-SemiBold.ttf $out/share/fonts/truetype/ZenOldMincho-SemiBold.ttf
     install -Dm644 ZenOldMincho-Bold.ttf $out/share/fonts/truetype/ZenOldMincho-Bold.ttf
     install -Dm644 ZenOldMincho-Black.ttf $out/share/fonts/truetype/ZenOldMincho-Black.ttf
  '';

  meta = with lib; {
    description = "Zen Old Mincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
