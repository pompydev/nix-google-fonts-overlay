{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "turret-road-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/turretroad/TurretRoad-ExtraLight.ttf?raw=true";
      name = "TurretRoad-ExtraLight.ttf";
      sha256 = "9f2fa201b4d7a717ca5cae486f083fe1aae4b0c35b98311c2a0eb5c9f2fac4f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/turretroad/TurretRoad-Light.ttf?raw=true";
      name = "TurretRoad-Light.ttf";
      sha256 = "8610f6b0b7eb0bea030f66eafcc9ebee1948f3fe18fdeac862677ed5c0e6ecfb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/turretroad/TurretRoad-Regular.ttf?raw=true";
      name = "TurretRoad-Regular.ttf";
      sha256 = "cce8cfb3cddbef28083bcb1513ec58f4a5c4764d3ec20c6bf49e5e3ecc89ddf9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/turretroad/TurretRoad-Medium.ttf?raw=true";
      name = "TurretRoad-Medium.ttf";
      sha256 = "a36a45d322f18ff5050b36a7a82e17a5c69685b2ef4b75508698bc8e06d80099";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/turretroad/TurretRoad-Bold.ttf?raw=true";
      name = "TurretRoad-Bold.ttf";
      sha256 = "e2d41e87abbaa1b53984df19938f81fd8b6715886d82bdf3af25497755eec4da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/turretroad/TurretRoad-ExtraBold.ttf?raw=true";
      name = "TurretRoad-ExtraBold.ttf";
      sha256 = "566338de973b47357317a9af96fe5e99c0fefe3d4e7707780bd78e8090c652b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TurretRoad-ExtraLight.ttf $out/share/fonts/truetype/TurretRoad-ExtraLight.ttf
     install -Dm644 TurretRoad-Light.ttf $out/share/fonts/truetype/TurretRoad-Light.ttf
     install -Dm644 TurretRoad-Regular.ttf $out/share/fonts/truetype/TurretRoad-Regular.ttf
     install -Dm644 TurretRoad-Medium.ttf $out/share/fonts/truetype/TurretRoad-Medium.ttf
     install -Dm644 TurretRoad-Bold.ttf $out/share/fonts/truetype/TurretRoad-Bold.ttf
     install -Dm644 TurretRoad-ExtraBold.ttf $out/share/fonts/truetype/TurretRoad-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Turret Road";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
