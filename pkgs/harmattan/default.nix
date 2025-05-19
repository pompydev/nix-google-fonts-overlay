{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "harmattan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/harmattan/Harmattan-Regular.ttf?raw=true";
      name = "Harmattan-Regular.ttf";
      sha256 = "1f3c746defd5404994f667c6e9e45d6961ba67475ac987788f7af0638173d5fe";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/harmattan/Harmattan-Medium.ttf?raw=true";
      name = "Harmattan-Medium.ttf";
      sha256 = "64d11b95dccd5130ad263cc13802872b1204e966da9959e2e8f367b7ddeca0b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/harmattan/Harmattan-SemiBold.ttf?raw=true";
      name = "Harmattan-SemiBold.ttf";
      sha256 = "979761b23e714beba0da76f1a2e6675604e394af53461de00bd1daaad80429a7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/harmattan/Harmattan-Bold.ttf?raw=true";
      name = "Harmattan-Bold.ttf";
      sha256 = "b32887dee3e6847c9044e17424a6876461e7371cf8d17cc7c430e2ac6d450bc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Harmattan-Regular.ttf $out/share/fonts/truetype/Harmattan-Regular.ttf
     install -Dm644 Harmattan-Medium.ttf $out/share/fonts/truetype/Harmattan-Medium.ttf
     install -Dm644 Harmattan-SemiBold.ttf $out/share/fonts/truetype/Harmattan-SemiBold.ttf
     install -Dm644 Harmattan-Bold.ttf $out/share/fonts/truetype/Harmattan-Bold.ttf
  '';

  meta = with lib; {
    description = "Harmattan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
