{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-collegiate-one-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisanscollegiateonesc/AlumniSansCollegiateOneSC-Regular.ttf?raw=true";
      name = "AlumniSansCollegiateOneSC-Regular.ttf";
      sha256 = "dae9c9d91919a15c3bf226538a5dc2bab1bc108d685bdaea3232979cc100de53";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisanscollegiateonesc/AlumniSansCollegiateOneSC-Italic.ttf?raw=true";
      name = "AlumniSansCollegiateOneSC-Italic.ttf";
      sha256 = "e6a3630296c51921596647bd834f7fbfa5b04fe9335e4b33ad9ee702ac8654d7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSansCollegiateOneSC-Regular.ttf $out/share/fonts/truetype/AlumniSansCollegiateOneSC-Regular.ttf
     install -Dm644 AlumniSansCollegiateOneSC-Italic.ttf $out/share/fonts/truetype/AlumniSansCollegiateOneSC-Italic.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans Collegiate One SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
