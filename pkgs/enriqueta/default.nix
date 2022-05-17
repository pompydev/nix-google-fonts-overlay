{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "enriqueta-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/58c23711f0f5610e053664f0cbe7bcab088621cb/ofl/enriqueta/Enriqueta-Regular.ttf?raw=true";
      name = "Enriqueta-Regular.ttf";
      sha256 = "5e3aca4c6daf22188a92717b7ed53221519daa96b7f85117601ebf1890686716";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/58c23711f0f5610e053664f0cbe7bcab088621cb/ofl/enriqueta/Enriqueta-Medium.ttf?raw=true";
      name = "Enriqueta-Medium.ttf";
      sha256 = "be7455fe09db15b36ee858d66ac59d0ab31e37b04b4253099fd869258f9b5592";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/58c23711f0f5610e053664f0cbe7bcab088621cb/ofl/enriqueta/Enriqueta-SemiBold.ttf?raw=true";
      name = "Enriqueta-SemiBold.ttf";
      sha256 = "b866967948a53bd516d441c0b04f0bbc4b45061a8d1d57e7a8989eab2bd9cc18";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/58c23711f0f5610e053664f0cbe7bcab088621cb/ofl/enriqueta/Enriqueta-Bold.ttf?raw=true";
      name = "Enriqueta-Bold.ttf";
      sha256 = "bb453797b5e353990c4569994754c2496640f427331c9f33b51414ed56777412";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Enriqueta-Regular.ttf $out/share/fonts/truetype/Enriqueta-Regular.ttf
     install -Dm644 Enriqueta-Medium.ttf $out/share/fonts/truetype/Enriqueta-Medium.ttf
     install -Dm644 Enriqueta-SemiBold.ttf $out/share/fonts/truetype/Enriqueta-SemiBold.ttf
     install -Dm644 Enriqueta-Bold.ttf $out/share/fonts/truetype/Enriqueta-Bold.ttf
  '';

  meta = with lib; {
    description = "Enriqueta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
