# homebrew-tap

Homebrew tap for [DevSweep](https://github.com/karuneshpalekar/DevSweep), a cleaner for developer Macs.

```bash
brew install --cask karuneshpalekar/tap/devsweep
```

Update with `brew upgrade --cask devsweep`, remove with `brew uninstall --cask devsweep` (add `--zap` to delete its settings and history too).

DevSweep builds are ad-hoc signed, not notarized by Apple. The cask clears macOS's quarantine flag after installing so the app opens normally.
