{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-thai-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-Thin.ttf?raw=true";
      name = "IBMPlexSansThai-Thin.ttf";
      sha256 = "65f2cd4ed6f23048622bba1a1062c05c2ff80e603d202fdccf303cf3d5d085e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansThai-ExtraLight.ttf";
      sha256 = "b1ba0c97d959657832c1a0929c274e4d4d8128ca2c52d24c6835cf87fb4a5a04";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-Light.ttf?raw=true";
      name = "IBMPlexSansThai-Light.ttf";
      sha256 = "b8e2da56ec11f1965af59a7119ee0b9b78773a9c9a89ae049b4975c9197b5c8d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-Regular.ttf?raw=true";
      name = "IBMPlexSansThai-Regular.ttf";
      sha256 = "eee061d1bac39be40f9bb94498898cd1894f5d3d9a2f0ee6cbd48a6bd03d052b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-Medium.ttf?raw=true";
      name = "IBMPlexSansThai-Medium.ttf";
      sha256 = "46ba1b7365cc2c583914f23914cce46e836a72662e34f6e3029b15aaa10b792e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-SemiBold.ttf?raw=true";
      name = "IBMPlexSansThai-SemiBold.ttf";
      sha256 = "9d7526a0c8dfad63c49815d0cce9eea1026f018468b81c579997e953620a67d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b7aef15c0d06b8939bb92917136b27aaae5ea91/ofl/ibmplexsansthai/IBMPlexSansThai-Bold.ttf?raw=true";
      name = "IBMPlexSansThai-Bold.ttf";
      sha256 = "f88fbe0a3717c93deddf4b13e50a05c9adcd38f58d675d9d5d0b869961851667";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansThai-Thin.ttf $out/share/fonts/truetype/IBMPlexSansThai-Thin.ttf
     install -Dm644 IBMPlexSansThai-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansThai-ExtraLight.ttf
     install -Dm644 IBMPlexSansThai-Light.ttf $out/share/fonts/truetype/IBMPlexSansThai-Light.ttf
     install -Dm644 IBMPlexSansThai-Regular.ttf $out/share/fonts/truetype/IBMPlexSansThai-Regular.ttf
     install -Dm644 IBMPlexSansThai-Medium.ttf $out/share/fonts/truetype/IBMPlexSansThai-Medium.ttf
     install -Dm644 IBMPlexSansThai-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansThai-SemiBold.ttf
     install -Dm644 IBMPlexSansThai-Bold.ttf $out/share/fonts/truetype/IBMPlexSansThai-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Thai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
