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

1. Component Declaration
   - Run the script `./scripts/deploy_components.sh --components --debug` to declare all components.
   - **Note**: This script may need to be executed multiple times until all components are declared without any errors.

2. Provider Deployment & Setup
   - Use the script `./scripts/deploy_components.sh --provider --debug` to deploy and set up the provider.

3. Component register into Provider
   - Use the script `./scripts/deploy_components.sh --register --debug` to deploy and set up the provider.

4. Metadata Class Declaration
   - Declare classes using the script `./scripts/declare_contracts.sh --contracts --debug`.

5. Project Contract Provider Setup
   - Set the provider on the Project contract.

6. Project URI Setup
   - Set the Project URI.

7. Slot URI Setup
   - Set the Slot URI.


## 📄 License

This project is released under the Apache license.
