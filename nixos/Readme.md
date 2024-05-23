```bash
sudo nixos-rebuild --flake .#desktop switch
```

### Cleaning old generations 

```bash
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

Then remove unused: 

```bash
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations 1 
```


