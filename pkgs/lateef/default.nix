{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lateef-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-ExtraLight.ttf?raw=true";
      name = "Lateef-ExtraLight.ttf";
      sha256 = "20f088ae3300b291ce1e7ce107a8c8ca5434407bb07bd5f5c97b6f2768629198";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-Light.ttf?raw=true";
      name = "Lateef-Light.ttf";
      sha256 = "9132ed29d746563b6a7aaf6ba0da0e14effeb60769958deb94d57f30b704ef16";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-Regular.ttf?raw=true";
      name = "Lateef-Regular.ttf";
      sha256 = "6a1d1a81553aadac4e30790f4e999277c0b7808d931d729639c4e91171009575";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-Medium.ttf?raw=true";
      name = "Lateef-Medium.ttf";
      sha256 = "507a0fed6aa6f5026eb7f00ed67b3358c4a31b6dbc12502c0fa01464910eba71";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-SemiBold.ttf?raw=true";
      name = "Lateef-SemiBold.ttf";
      sha256 = "c5b60f7113bb109fe0b87e55291ed6e9fad8b7c280e48700c4195b37d35cce37";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-Bold.ttf?raw=true";
      name = "Lateef-Bold.ttf";
      sha256 = "337c7b04346d0d88ddaf712f0d9d1cad50af68b6350a1104d82eb0c0be25d311";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lateef/Lateef-ExtraBold.ttf?raw=true";
      name = "Lateef-ExtraBold.ttf";
      sha256 = "b1a237fa69222ebcc9af5e79985e977f9484f522c410660f15ae6a2037868a84";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lateef-ExtraLight.ttf $out/share/fonts/truetype/Lateef-ExtraLight.ttf
     install -Dm644 Lateef-Light.ttf $out/share/fonts/truetype/Lateef-Light.ttf
     install -Dm644 Lateef-Regular.ttf $out/share/fonts/truetype/Lateef-Regular.ttf
     install -Dm644 Lateef-Medium.ttf $out/share/fonts/truetype/Lateef-Medium.ttf
     install -Dm644 Lateef-SemiBold.ttf $out/share/fonts/truetype/Lateef-SemiBold.ttf
     install -Dm644 Lateef-Bold.ttf $out/share/fonts/truetype/Lateef-Bold.ttf
     install -Dm644 Lateef-ExtraBold.ttf $out/share/fonts/truetype/Lateef-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Lateef";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
