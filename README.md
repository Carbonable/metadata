<div align="center">
  <h1 align="center">Carbonable Metadata</h1>
  <p align="center">
    <a href="https://discord.gg/qqkBpmRDFE">
        <img src="https://img.shields.io/badge/Discord-6666FF?style=for-the-badge&logo=discord&logoColor=white">
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=Carbonable_io">
        <img src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white">
    </a>       
  </p>
  <h3 align="center">Carbonable Metadata Repository.</h3>
</div>

## About

This repository contains all the relevants assets for on-chain generation of Carbonable metadata.

## Project setup

### 📦 Requirements

- [scarb 0.7.0](https://docs.swmansion.com/scarb/download.html#install-via-asdf)

### ⛏️ Compile

```bash
scarb build
```

### 🌡️ Test

```bash
scarb test
```

## 📚 Deployment

Instructions for deployment

1. Declare the components: `bash scripts/deploy_components.sh` (stop before the 1 minute pause) TODO : Need to write scrip with multi-call for register components
2. Declare the Metadata implementations: `bash scripts/declare_contracts.sh`
3. Deploy and configure the provider: `bash scripts/deploy_components.sh`

## 📄 License

This project is released under the Apache license.
