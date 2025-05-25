{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-jp-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-Thin.ttf?raw=true";
      name = "IBMPlexSansJP-Thin.ttf";
      sha256 = "773042bf5e8f428d46fcf81b9255c6a451f20cbd39983f308e96808a2e15e134";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansJP-ExtraLight.ttf";
      sha256 = "83b3a8d967295c162938946d6a9395d539c95fd53e161e0e4b01e5d7f39a2ea6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-Light.ttf?raw=true";
      name = "IBMPlexSansJP-Light.ttf";
      sha256 = "f6390231b0ce848866d5599765897d4b882d6b29dc0484dd4d1a5435b05761ba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-Regular.ttf?raw=true";
      name = "IBMPlexSansJP-Regular.ttf";
      sha256 = "372f8bba95f386856ae435dc0e69f08db1cac29bed513d99171a0ae2d307ba2a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-Medium.ttf?raw=true";
      name = "IBMPlexSansJP-Medium.ttf";
      sha256 = "1d09f5e25b19e54b2c55da70de58f9962512c3e07ed7c3e1c9bad77ace5c22e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-SemiBold.ttf?raw=true";
      name = "IBMPlexSansJP-SemiBold.ttf";
      sha256 = "5985c29d2d5d444072915cf5874dc80e0a3f5fadbf14a9e3013a03a8fe6d7ff5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexsansjp/IBMPlexSansJP-Bold.ttf?raw=true";
      name = "IBMPlexSansJP-Bold.ttf";
      sha256 = "bd8a98b9b55c9ea3f0fa1ed094c15981788cc9a41b0357f4453014fd1d44da19";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansJP-Thin.ttf $out/share/fonts/truetype/IBMPlexSansJP-Thin.ttf
     install -Dm644 IBMPlexSansJP-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansJP-ExtraLight.ttf
     install -Dm644 IBMPlexSansJP-Light.ttf $out/share/fonts/truetype/IBMPlexSansJP-Light.ttf
     install -Dm644 IBMPlexSansJP-Regular.ttf $out/share/fonts/truetype/IBMPlexSansJP-Regular.ttf
     install -Dm644 IBMPlexSansJP-Medium.ttf $out/share/fonts/truetype/IBMPlexSansJP-Medium.ttf
     install -Dm644 IBMPlexSansJP-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansJP-SemiBold.ttf
     install -Dm644 IBMPlexSansJP-Bold.ttf $out/share/fonts/truetype/IBMPlexSansJP-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans JP";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
