# System Environment

This system is running **NixOS**, a purely functional Linux distribution.

## Important NixOS Characteristics

- **No FHS (Filesystem Hierarchy Standard)**: Standard paths like `/usr/bin` don't exist
- **Immutable system**: System packages are installed via Nix configuration, not traditional package managers
- **Nix store**: All packages live in `/nix/store` with unique hashes
- **Isolated environments**: Use `nix-shell` for project-specific dependencies

## Python on NixOS

Usually python projects already have a `shell.nix` present which is usually already activated
(usually because it reads some secrets from 1Password and injects as environment variables).
This means you should be able to run python from bash even if you haven't activated it yourself.

You can check this with the environment variable `IN_NIX_SHELL` which is set when inside a nix shell.

### Python Environment Rules

1. **Never use `pip install` globally** - it will fail or cause conflicts
2. **Use nix-shell for dependencies**: Create a `shell.nix` or use `nix-shell -p python3Packages.packageName`
3. **Virtual environments**: Use `python -m venv` within nix-shell if needed
4. **Project-specific Python**: Always specify Python and dependencies in nix expressions

### Running Python Commands

When running Python scripts:

```bash
# Option 1: Use nix-shell ad-hoc
nix-shell -p python3 python3Packages.numpy --run "python script.py"

# Option 2: Enter nix-shell first
nix-shell -p python3 python3Packages.requests
python script.py

# Option 3: Use poetry2nix or similar for projects
```

## Common Tool Patterns on NixOS

### Package Installation

```bash
# Ad-hoc environment
nix-shell -p packageName

# For development
nix develop

# Install to profile (avoid when possible)
nix profile install nixpkgs#packageName
```

### Build Commands

- Most projects need `nix-shell` or `nix develop` first
- Check for `shell.nix`, `flake.nix`, or `default.nix` in project root
- Use `nix build` instead of traditional build commands when possible

## When Creating Scripts

- Make scripts portable by using `nix-shell` shebangs:

```python
  #!/usr/bin/env nix-shell
  #!nix-shell -i python3 -p python3 python3Packages.requests
```

## Environment Variables

- `NIX_PATH`: Points to nix channels
- `PATH`: Contains only explicitly declared packages
- Many standard tools may not be available without declaring them
