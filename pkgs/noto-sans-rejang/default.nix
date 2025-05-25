{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-rejang-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansrejang/NotoSansRejang-Regular.ttf?raw=true";
      name = "NotoSansRejang-Regular.ttf";
      sha256 = "27a3f1e60bf4ed7b7a5956fea6505e7ac0861397e0ff0acc112ab42451dc40e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansRejang-Regular.ttf $out/share/fonts/truetype/NotoSansRejang-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Rejang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
