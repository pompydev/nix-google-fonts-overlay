{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-inline-one-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d2ed457c9dd46f3cd26c99a492e4f723206542ef/ofl/alumnisansinlineone/AlumniSansInlineOne-Regular.ttf?raw=true";
      name = "AlumniSansInlineOne-Regular.ttf";
      sha256 = "e77a9db5e63f9316840cab59d1364cd40334d6cd441c0b43fe2a18b2521e0e7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d2ed457c9dd46f3cd26c99a492e4f723206542ef/ofl/alumnisansinlineone/AlumniSansInlineOne-Italic.ttf?raw=true";
      name = "AlumniSansInlineOne-Italic.ttf";
      sha256 = "ba98fe1a9aa70f60417851b357882e0275a3f586ff4039c8f258b4af638171ff";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSansInlineOne-Regular.ttf $out/share/fonts/truetype/AlumniSansInlineOne-Regular.ttf
     install -Dm644 AlumniSansInlineOne-Italic.ttf $out/share/fonts/truetype/AlumniSansInlineOne-Italic.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans Inline One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
