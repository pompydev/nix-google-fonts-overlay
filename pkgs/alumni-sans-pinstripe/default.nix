{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-pinstripe-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisanspinstripe/AlumniSansPinstripe-Regular.ttf?raw=true";
      name = "AlumniSansPinstripe-Regular.ttf";
      sha256 = "c00bc8d641f2ddc444bbb9a07125f4eb1e6eda0384a896196ad0c7be0a9cfeea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisanspinstripe/AlumniSansPinstripe-Italic.ttf?raw=true";
      name = "AlumniSansPinstripe-Italic.ttf";
      sha256 = "5639e0d5bfec3719f127139d232c60c42aa3ae661b580e405e6a9b06002ab6be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSansPinstripe-Regular.ttf $out/share/fonts/truetype/AlumniSansPinstripe-Regular.ttf
     install -Dm644 AlumniSansPinstripe-Italic.ttf $out/share/fonts/truetype/AlumniSansPinstripe-Italic.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans Pinstripe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
