{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comic-relief-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/comicrelief/ComicRelief-Regular.ttf?raw=true";
      name = "ComicRelief-Regular.ttf";
      sha256 = "9ef4958ab06385d91f635f83a15569786b243f9d010cfb3f9a5cdda593c7bc22";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/comicrelief/ComicRelief-Bold.ttf?raw=true";
      name = "ComicRelief-Bold.ttf";
      sha256 = "33aee007212b696afd57d50c901135cd723cd188f7ad98f3a1c572ea64e8f0d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ComicRelief-Regular.ttf $out/share/fonts/truetype/ComicRelief-Regular.ttf
     install -Dm644 ComicRelief-Bold.ttf $out/share/fonts/truetype/ComicRelief-Bold.ttf
  '';

  meta = with lib; {
    description = "Comic Relief";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
