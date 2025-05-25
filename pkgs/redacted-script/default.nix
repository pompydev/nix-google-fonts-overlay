{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "redacted-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redactedscript/RedactedScript-Light.ttf?raw=true";
      name = "RedactedScript-Light.ttf";
      sha256 = "5ff11d7b9510a90cbee1525564457b6991a65e0a413ecc4fdbdde697452fe665";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redactedscript/RedactedScript-Regular.ttf?raw=true";
      name = "RedactedScript-Regular.ttf";
      sha256 = "1ebaab9642a2f43fa33f449760469903143fd1d08b2433eb6c15e28602d9360d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redactedscript/RedactedScript-Bold.ttf?raw=true";
      name = "RedactedScript-Bold.ttf";
      sha256 = "48ad6a76be6f094893541898d1c9a04e3debe48645c314cf07add92c019e7983";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedactedScript-Light.ttf $out/share/fonts/truetype/RedactedScript-Light.ttf
     install -Dm644 RedactedScript-Regular.ttf $out/share/fonts/truetype/RedactedScript-Regular.ttf
     install -Dm644 RedactedScript-Bold.ttf $out/share/fonts/truetype/RedactedScript-Bold.ttf
  '';

  meta = with lib; {
    description = "Redacted Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
