{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gujarati-ui-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-Thin.ttf?raw=true";
      name = "NotoSansGujaratiUI-Thin.ttf";
      sha256 = "4c513b4be825c276e8c32966ebb2034408e993ac9f2eea42ac98d6707357fbff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-ExtraLight.ttf?raw=true";
      name = "NotoSansGujaratiUI-ExtraLight.ttf";
      sha256 = "83e3e41358c38c92ba883747804ec4318a80957a9bb1d59fdd25e4025afa1a15";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-Light.ttf?raw=true";
      name = "NotoSansGujaratiUI-Light.ttf";
      sha256 = "bf35a1bb4d244d5497a9bfdf425401c6a6b7cf3a99a8d96d0cfb03ee9715c210";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-Regular.ttf?raw=true";
      name = "NotoSansGujaratiUI-Regular.ttf";
      sha256 = "59c3611a41f68c55a22963fbfba9489cda4f06da3a03b1ede65eb76073ec7584";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-Medium.ttf?raw=true";
      name = "NotoSansGujaratiUI-Medium.ttf";
      sha256 = "194e67b03518fd263afa90ac6c6366b11ddf134deb351355d1c44910094af20e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-SemiBold.ttf?raw=true";
      name = "NotoSansGujaratiUI-SemiBold.ttf";
      sha256 = "035b9cbbf3e1762c05138351cfd9b93a21f7fdcf95275162f01645c11a5b5d0e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-Bold.ttf?raw=true";
      name = "NotoSansGujaratiUI-Bold.ttf";
      sha256 = "2c91d8e29fdebae8b3a50c0d3212f513e524db9eb1d10a34f729c25c4a5cd6f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-ExtraBold.ttf?raw=true";
      name = "NotoSansGujaratiUI-ExtraBold.ttf";
      sha256 = "f58426066b454e32df586e3b50478d380ae1d0c6683a50fea08782e1f986c766";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgujaratiui/NotoSansGujaratiUI-Black.ttf?raw=true";
      name = "NotoSansGujaratiUI-Black.ttf";
      sha256 = "b1a9f30113e5253a5fcb9a2edd7c7032fff776c2e4ac2b803ab900392db09695";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGujaratiUI-Thin.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-Thin.ttf
     install -Dm644 NotoSansGujaratiUI-ExtraLight.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-ExtraLight.ttf
     install -Dm644 NotoSansGujaratiUI-Light.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-Light.ttf
     install -Dm644 NotoSansGujaratiUI-Regular.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-Regular.ttf
     install -Dm644 NotoSansGujaratiUI-Medium.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-Medium.ttf
     install -Dm644 NotoSansGujaratiUI-SemiBold.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-SemiBold.ttf
     install -Dm644 NotoSansGujaratiUI-Bold.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-Bold.ttf
     install -Dm644 NotoSansGujaratiUI-ExtraBold.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-ExtraBold.ttf
     install -Dm644 NotoSansGujaratiUI-Black.ttf $out/share/fonts/truetype/NotoSansGujaratiUI-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gujarati UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
