{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "besley-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/85c5cea9da66117723c05bf5d7a7143fd10a411b/ofl/besley/Besley[wght].ttf?raw=true";
      name = "Besley[wght].ttf";
      sha256 = "71f352d8859c787631a0978161d48497a72caa69dcae6996d6712a564df86c1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/85c5cea9da66117723c05bf5d7a7143fd10a411b/ofl/besley/Besley-Italic[wght].ttf?raw=true";
      name = "Besley-Italic[wght].ttf";
      sha256 = "de502a1ab6b06a63982dce8c9e58b3eee8aada175e78d5a4dc0a7b3721f26562";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Besley[wght].ttf' $out/share/fonts/truetype/'Besley[wght].ttf'
     install -Dm644 'Besley-Italic[wght].ttf' $out/share/fonts/truetype/'Besley-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Besley";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
