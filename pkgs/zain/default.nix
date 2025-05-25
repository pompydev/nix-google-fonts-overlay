{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zain-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-ExtraLight.ttf?raw=true";
      name = "Zain-ExtraLight.ttf";
      sha256 = "02d303e701157f00c22659199b719e9c769338e6d96e19ec98cd257dbd12dcf2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-Light.ttf?raw=true";
      name = "Zain-Light.ttf";
      sha256 = "79f981f5d6aed48378c3e5459cda52554a03eccb85936e2c56ec067a789d08ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-LightItalic.ttf?raw=true";
      name = "Zain-LightItalic.ttf";
      sha256 = "cd1a7f68124ec4b2888e336689e99f136ccbc1975f4a374a9128a224e696949c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-Regular.ttf?raw=true";
      name = "Zain-Regular.ttf";
      sha256 = "79530b5a85147bb83ae176b9bce6a0688294d3c2e473cdd52fc0cbc044c9e68e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-Italic.ttf?raw=true";
      name = "Zain-Italic.ttf";
      sha256 = "ee2c712e13bef6def6e15608b93634e534b0999edf7ecb6286dc0f03a46a7e33";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-Bold.ttf?raw=true";
      name = "Zain-Bold.ttf";
      sha256 = "38c6412e12defe59d8d22e707fec080b2d331d7ba47b1ab4a75bfb07dfbcf984";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-ExtraBold.ttf?raw=true";
      name = "Zain-ExtraBold.ttf";
      sha256 = "752a82e156a095822e8168bf9629289dbbb5c339418e7db29fd7cea0a21926a3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zain/Zain-Black.ttf?raw=true";
      name = "Zain-Black.ttf";
      sha256 = "e25c98d03a63b6bf4ba9da45b4bfc74f9bbe672c4d02091773d5cba42e2d66ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Zain-ExtraLight.ttf $out/share/fonts/truetype/Zain-ExtraLight.ttf
     install -Dm644 Zain-Light.ttf $out/share/fonts/truetype/Zain-Light.ttf
     install -Dm644 Zain-LightItalic.ttf $out/share/fonts/truetype/Zain-LightItalic.ttf
     install -Dm644 Zain-Regular.ttf $out/share/fonts/truetype/Zain-Regular.ttf
     install -Dm644 Zain-Italic.ttf $out/share/fonts/truetype/Zain-Italic.ttf
     install -Dm644 Zain-Bold.ttf $out/share/fonts/truetype/Zain-Bold.ttf
     install -Dm644 Zain-ExtraBold.ttf $out/share/fonts/truetype/Zain-ExtraBold.ttf
     install -Dm644 Zain-Black.ttf $out/share/fonts/truetype/Zain-Black.ttf
  '';

  meta = with lib; {
    description = "Zain";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
