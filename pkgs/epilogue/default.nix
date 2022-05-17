{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "epilogue-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/07078f01d0d661d2cba6c4e6ef09c927af35e668/ofl/epilogue/Epilogue%5Bwght%5D.ttf?raw=true";
      name = "Epilogue_wght_.ttf";
      sha256 = "012f651b45f47c10c7714cb7e3f2f7d9ccb7f235a2cc72c6b273ddc735705c67";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/07078f01d0d661d2cba6c4e6ef09c927af35e668/ofl/epilogue/Epilogue-Italic%5Bwght%5D.ttf?raw=true";
      name = "Epilogue-Italic_wght_.ttf";
      sha256 = "7e5263bfe5b8ea9d46201fc3e3d59c354628de2220c3f3fe831fad946a1f7db2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Epilogue_wght_.ttf $out/share/fonts/truetype/Epilogue_wght_.ttf
     install -Dm644 Epilogue-Italic_wght_.ttf $out/share/fonts/truetype/Epilogue-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Epilogue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
