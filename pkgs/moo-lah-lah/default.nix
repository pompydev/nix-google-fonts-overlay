{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moo-lah-lah-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/moolahlah/MooLahLah-Regular.ttf?raw=true";
      name = "MooLahLah-Regular.ttf";
      sha256 = "127fe2e6787812cffd617ea3a114f945e912d550aba5492cf0f3b800d0a1902f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MooLahLah-Regular.ttf $out/share/fonts/truetype/MooLahLah-Regular.ttf
  '';

  meta = with lib; {
    description = "Moo Lah Lah";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
