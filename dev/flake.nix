{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    cpp = 
      pkgs.mkShell
        {
     	  buildInputs = [
	    pkgs.gcc
            pkgs.clang
 	  ];

	  shellHook = ''
	    echo "Cpp env"
	  '';
        };

    node =
      pkgs.mkShell
        {
     	  buildInputs = [
	    pkgs.nodejs
 	  ];

	  shellHook = ''
	    echo "Node env"
	  '';
        };
  };
}
