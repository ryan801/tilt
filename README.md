# Tilt

![Build](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Status](https://img.shields.io/badge/status-experimental-orange)

**Tilt** is an experimental cryptocurrency that explores **configurable block discovery distributions** for mining rewards.

Traditional cryptocurrencies use a **Poisson (exponential) process** for block discovery. Tilt allows miners to select alternative statistical models while preserving the same expected block time.

The goal is to study how **variance, hazard rate, and reward distribution psychology** affect mining behavior and network dynamics.

Tilt is currently a **research and experimentation project**, not a production financial system.

---

## Why Tilt Exists

Most proof-of-work cryptocurrencies share the same mining model:

- Block discovery follows an **exponential distribution**
- Expected block time is determined by **difficulty / hashrate**
- Variance in block discovery can lead to **long droughts or lucky streaks**

Tilt asks a simple question:

> What happens if miners can choose different statistical distributions for block discovery while keeping the same expected block time?

By controlling **variance without changing expectation**, Tilt allows exploration of:

- Mining psychology  
- Reward volatility  
- Network stability  
- Pool formation incentives  

---

## Core Idea

Tilt keeps the **expected block time identical across all mining modes**.

Expected block time is computed dynamically:
```
μ = difficulty / hashrate

Each mining distribution is scaled around the same μ.

This ensures that:
- long-run rewards remain equal
- only the variance and tail behavior differ
```

### Supported Mining Distributions

Tilt currently implements the following block discovery models:

| Distribution | Description |
|---|---|
| **Exponential** | Standard Poisson mining model used by Bitcoin and most PoW chains |
| **Weibull (k=2)** | Increasing hazard rate, producing more consistent block timing |
| **Erlang-2** | Two-phase discovery with reduced variance |
| **Log-Normal** | Right-skewed distribution with occasional long waits |
| **Hyperexponential** | High-variance bursty model with frequent short waits and rare droughts |

All distributions are normalized so that:
```
E[T] = μ
```

This preserves fairness while allowing miners to choose their preferred variance profile.

---

## Architecture Overview

Tilt separates mining into a distribution abstraction layer:
```
+----------------------+
| Wallet (CLI / GUI)   |
+----------+-----------+
           |
           v
+----------------------+
| RPC / P2P Interface  |
+----------+-----------+
           |
           v
+----------------------+
| Consensus Engine     |
| Block Validation     |
+----------+-----------+
           |
           v
+----------------------+
| Mining Engine        |
| Distribution Layer   |
+----------------------+
```

The mining engine allows block discovery to follow multiple statistical models while preserving identical expected reward rates.

---

## Current Status

Tilt currently includes:

- Full blockchain daemon
- Wallet implementation
- Configurable mining distributions
- Cross-platform builds (Linux, macOS, Windows)
- CI pipelines and static analysis

The project is still under development and should be treated as experimental software.

---

## Quick Start

### Clone the repository:
```bash
git clone --recursive https://github.com/yourname/tilt.git
cd tilt
```

### Build the project:
```bash
mkdir build
cd build
cmake ..
make -j
```

### Run the daemon:
```bash
./tiltd
```

### Create or open a wallet:
```bash
./tilt-wallet-cli
```

---

## Building

### Requirements

Typical dependencies include:

- CMake
- Boost
- OpenSSL
- libsodium
- ZeroMQ
- protobuf
- standard build tools

### Example build:
```bash
git clone --recursive https://github.com/yourname/tilt.git
cd tilt
mkdir build
cd build
cmake ..
make -j
```

---

## Documentation

Additional documentation will be expanded in the `/docs` directory.

Planned documentation includes:

- Mining distribution models
- Protocol architecture
- Statistical analysis tools
- Consensus design notes

---

## Research Direction

Tilt may be useful as a platform for:

- Mining reward simulations
- Economic modeling
- Distributed systems experiments
- Probabilistic consensus research

Researchers and developers interested in exploring alternative mining dynamics are encouraged to experiment with the code.

---

## Roadmap

Possible future work includes:

- Mining distribution visualization tools
- Monte Carlo mining simulations
- Network propagation analysis
- Variance impact studies
- Improved developer documentation

---

## Contributing

Contributions are welcome.

Areas where help would be valuable:

- Statistical modeling tools
- Mining simulations
- Network stress testing
- Documentation improvements
- Security auditing

Please open an issue before submitting large changes.

---

## Security Notice

Tilt is experimental software and has not undergone formal security auditing.

**Do not use it to store real value.**

---

## Citation

If you use Tilt for research, please cite:
```
Tilt: A Blockchain Experiment in Configurable Mining Distributions
Ryan (2026)
https://github.com/yourname/tilt
```

---

## License

MIT License

Copyright (c) 2025-2026 Ryan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## License

[LICENSE](LICENSE)

MIT License
Tilt Project
Copyright (c) 2026 Ryan

Copyright (c) 2018-2024 The Nerve Project.
Copyright (c) 2014-2024 The Monero Project.  
Copyright (c) 2017-2018 The Masari Project.  
Portions Copyright (c) 2012-2013 The Cryptonote developers. 

<!-- Reference links -->
[tilt-releases-link]: https://github.com/tilt-project/tilt/releases/latest
[tilt-docs-link]: https://docs.tilt.one
[tilt-issues-link]: https://github.com/tilt-project/tilt/issues
[tilt-discord-link]: https://discord.gg/ufysfvcFwe
