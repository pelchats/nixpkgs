# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal }:

cabal.mkDerivation (self: {
  pname = "hex";
  version = "0.1.2";
  sha256 = "1v31xiaivrrn0q2jz8919wvkjplv1kxna5ajhsj701fqxm1i5vhj";
  meta = {
    description = "Convert strings into hexadecimal and back";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
