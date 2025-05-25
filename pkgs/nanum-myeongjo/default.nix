{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-myeongjo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanummyeongjo/NanumMyeongjo-Regular.ttf?raw=true";
      name = "NanumMyeongjo-Regular.ttf";
      sha256 = "7ed9e8653a8ed04285d51dc343ffea6eb3d9c73afc27383ea8929ee4ffd03205";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanummyeongjo/NanumMyeongjo-Bold.ttf?raw=true";
      name = "NanumMyeongjo-Bold.ttf";
      sha256 = "bc9ed8e60d93fe6db054b8fb988481b625f2eef8cb2317ad0e9834681b8fe3f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanummyeongjo/NanumMyeongjo-ExtraBold.ttf?raw=true";
      name = "NanumMyeongjo-ExtraBold.ttf";
      sha256 = "60c0077fce069ba90ae97c0a3679f6eb3712e0ca637bdd0c15b72d335ec46db7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumMyeongjo-Regular.ttf $out/share/fonts/truetype/NanumMyeongjo-Regular.ttf
     install -Dm644 NanumMyeongjo-Bold.ttf $out/share/fonts/truetype/NanumMyeongjo-Bold.ttf
     install -Dm644 NanumMyeongjo-ExtraBold.ttf $out/share/fonts/truetype/NanumMyeongjo-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Nanum Myeongjo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
