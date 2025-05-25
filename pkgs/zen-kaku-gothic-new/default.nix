{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-kaku-gothic-new-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenkakugothicnew/ZenKakuGothicNew-Light.ttf?raw=true";
      name = "ZenKakuGothicNew-Light.ttf";
      sha256 = "ad4e9733f96397ed0c99c295d9b3b56e39a0e0bc02b0ac56ce3ade7793a1eef1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenkakugothicnew/ZenKakuGothicNew-Regular.ttf?raw=true";
      name = "ZenKakuGothicNew-Regular.ttf";
      sha256 = "b840cd07a67d89cacca44249ae49aa99ee7640eb5ce623be8d8983d6aabac801";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenkakugothicnew/ZenKakuGothicNew-Medium.ttf?raw=true";
      name = "ZenKakuGothicNew-Medium.ttf";
      sha256 = "651a3f7280b7f36262601ee76d8388a8dc4372dcc67aff025a608939a562b525";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenkakugothicnew/ZenKakuGothicNew-Bold.ttf?raw=true";
      name = "ZenKakuGothicNew-Bold.ttf";
      sha256 = "0081cedabc4921982fcd061f845a005664ac7fb642af2dd34b4007bc63ccd235";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zenkakugothicnew/ZenKakuGothicNew-Black.ttf?raw=true";
      name = "ZenKakuGothicNew-Black.ttf";
      sha256 = "795819a979184981842994d8f4eb9e14ce443d687bd5e731d6ca67ded8f92261";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenKakuGothicNew-Light.ttf $out/share/fonts/truetype/ZenKakuGothicNew-Light.ttf
     install -Dm644 ZenKakuGothicNew-Regular.ttf $out/share/fonts/truetype/ZenKakuGothicNew-Regular.ttf
     install -Dm644 ZenKakuGothicNew-Medium.ttf $out/share/fonts/truetype/ZenKakuGothicNew-Medium.ttf
     install -Dm644 ZenKakuGothicNew-Bold.ttf $out/share/fonts/truetype/ZenKakuGothicNew-Bold.ttf
     install -Dm644 ZenKakuGothicNew-Black.ttf $out/share/fonts/truetype/ZenKakuGothicNew-Black.ttf
  '';

  meta = with lib; {
    description = "Zen Kaku Gothic New";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
