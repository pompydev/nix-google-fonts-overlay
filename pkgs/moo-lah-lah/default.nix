{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moo-lah-lah-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae657b2e1337f45ccc9b0d04a923ccb8c99822e2/ofl/moolahlah/MooLahLah-Regular.ttf?raw=true";
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
