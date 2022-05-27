{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-guntur-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/hindguntur/HindGuntur-Light.ttf?raw=true";
      name = "HindGuntur-Light.ttf";
      sha256 = "dd3847b40d16ee8f906b41928b5f0e3480ea9092524b5c6a949eb19dc458caf9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/hindguntur/HindGuntur-Regular.ttf?raw=true";
      name = "HindGuntur-Regular.ttf";
      sha256 = "2f9b4d31507c92fe1d54e5256904e41d91698b952c90d66bfe926cd156dac4eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/hindguntur/HindGuntur-Medium.ttf?raw=true";
      name = "HindGuntur-Medium.ttf";
      sha256 = "370d2838cc51cbf0060f164ffe11ecb35a2619452b8c8d200beccb50e3d0228c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/hindguntur/HindGuntur-SemiBold.ttf?raw=true";
      name = "HindGuntur-SemiBold.ttf";
      sha256 = "c143afa804c637d05c6c30542c0533820046d52e2c4c32dd7b6a8a51ef307594";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/hindguntur/HindGuntur-Bold.ttf?raw=true";
      name = "HindGuntur-Bold.ttf";
      sha256 = "e3e88e87a47094b34d1b0bc4a88f700cb1d1d35dd6286bd224bc35cc1712b167";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindGuntur-Light.ttf $out/share/fonts/truetype/HindGuntur-Light.ttf
     install -Dm644 HindGuntur-Regular.ttf $out/share/fonts/truetype/HindGuntur-Regular.ttf
     install -Dm644 HindGuntur-Medium.ttf $out/share/fonts/truetype/HindGuntur-Medium.ttf
     install -Dm644 HindGuntur-SemiBold.ttf $out/share/fonts/truetype/HindGuntur-SemiBold.ttf
     install -Dm644 HindGuntur-Bold.ttf $out/share/fonts/truetype/HindGuntur-Bold.ttf
  '';

  meta = with lib; {
    description = "Hind Guntur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
