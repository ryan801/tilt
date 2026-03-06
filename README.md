# Tilt

![Build](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Status](https://img.shields.io/badge/status-experimental-orange)

**Tilt** is an experimental proof-of-work cryptocurrency and research platform that challenges a foundational assumption every major PoW blockchain has inherited without question: that block discovery must follow a Poisson process.

It doesn't have to. Nobody ever asked why.

---

## The Observation

Every major proof-of-work cryptocurrency — Bitcoin, Monero, Litecoin, and virtually every fork or derivative — uses the same statistical model for block discovery: the **exponential distribution**, which is the continuous expression of a Poisson process.

This means block discovery is **memoryless**. The probability of finding the next block is independent of how long you've already been mining. No matter how long a drought lasts, your odds reset every second.

This choice was made early, inherited by every subsequent project, and has never been seriously questioned. It is not obviously correct. It is a design decision that became an assumption.

Tilt asks what happens when you change it.

---

## The Hypothesis

Different probability distributions produce different **variance profiles** around the same expected block time. A miner using an Erlang-2 distribution experiences more consistent rewards than one using the standard exponential model. A miner using a hyperexponential model experiences more volatile, bursty rewards.

If expected block time is held constant across all distributions, long-run rewards are mathematically identical. But the **experience** of mining is not.

This matters because miners are people, and people respond to variance differently than expected value calculations suggest they should. Behavioral economics has documented this extensively: loss aversion, the gambler's fallacy, sensitivity to streaks and droughts. A mining model that produces more consistent rewards may attract different behavior than one that produces volatile streaks — even when the math says they are equivalent.

Tilt is a platform for exploring whether this is true, and what the implications are for pool formation, miner retention, and network stability.

---

## Why This Hasn't Been Done Before

Most likely, because every project copied the last one.

CryptoNote inherited Poisson from Bitcoin. Monero inherited it from CryptoNote. Every fork inherited it from Monero. At no point in this lineage did anyone appear to ask "is this the right distribution, and why?" The assumption traveled intact through a decade of forks because the code worked and nobody was looking at it critically.

This is not unique to the distribution choice. It is representative of how much of the cryptocurrency space operates: a thin layer of branding over deeply inherited, unexamined fundamentals. Tilt is one specific place where that pattern is visible and testable.

---

## Core Design

Tilt preserves mathematical fairness across all mining modes by normalizing each distribution to the same expected block time:

```
μ = difficulty / hashrate
E[T] = μ  (for all supported distributions)
```

Only variance and tail behavior differ. Long-run expected rewards are identical regardless of which distribution a miner selects.

### Supported Mining Distributions

| Distribution | Behavior | Hazard Rate |
|---|---|---|
| **Exponential** | Standard Poisson model (Bitcoin baseline) | Constant |
| **Weibull (k=2)** | More consistent timing, increasing hazard rate | Increasing |
| **Erlang-2** | Two-phase discovery, reduced variance | Increasing then constant |
| **Log-Normal** | Right-skewed, occasional long waits | Non-monotonic |
| **Hyperexponential** | High variance, bursty rewards, rare droughts | Decreasing |

---

## Architecture

Tilt is forked from the Nerva/CryptoNote codebase and introduces a distribution abstraction layer in the mining engine:

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
| Distribution Layer   |  ← Tilt's core contribution
+----------------------+
```

The distribution layer allows block discovery timing to be governed by any supported statistical model while leaving consensus, validation, and networking unchanged.

---

## Current Status

Tilt has a functioning testnet with:

- Full blockchain daemon
- Wallet implementation with custom address prefix
- Configurable mining distributions
- Cross-platform builds (Linux, macOS, Windows)

This is a research proof of concept. The codebase is forked from Nerva/CryptoNote and **has not been audited for production use**. Known inherited security issues from upstream are present and unaddressed. Do not use this to store real value.

---

## Quick Start

### Clone and build:
```bash
git clone --recursive https://github.com/ryan801/tilt.git
cd tilt
mkdir build && cd build
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

### Dependencies:
- CMake
- Boost
- OpenSSL
- libsodium
- ZeroMQ
- Standard build tools

---

## Research Questions

Tilt is a platform, not an answer. Open questions this codebase could help explore:

- Does distribution choice measurably affect solo vs pool mining preference?
- Do miners exhibit loss aversion responses to drought-heavy distributions (Log-Normal, Hyperexponential)?
- Does reduced variance (Erlang-2, Weibull) improve miner retention on small networks?
- What are the network stability implications of heterogeneous distribution selection across miners?
- Is the Poisson assumption actually optimal for any metric, or purely historical?

---

## Roadmap

- Mining distribution visualization tools
- Monte Carlo simulation suite
- Empirical miner behavior analysis tools
- Network propagation modeling
- Expanded documentation on statistical models

---

## Contributing

Contributions welcome, particularly in:

- Statistical modeling and simulation
- Behavioral analysis tooling
- Security auditing of inherited codebase
- Documentation

Please open an issue before submitting large changes.

---

## Security

Tilt is experimental software forked from the Nerva/CryptoNote codebase. Security issues in the inherited code have not been fully remediated. This project has not undergone formal security auditing.

**Do not use it to store real value. Do not deploy it in production.**

---

## Citation

If you use Tilt in your research:

```
Tilt: A Blockchain Experiment in Configurable Mining Distributions
Ryan Shaw (2026)
https://github.com/ryan801/tilt
```

---

## License

MIT License

Copyright (c) 2025-2026 Ryan Shaw

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

*Portions derived from:*  
*Copyright (c) 2018-2024 The Nerva Project*  
*Copyright (c) 2014-2024 The Monero Project*  
*Copyright (c) 2017-2018 The Masari Project*  
*Portions Copyright (c) 2012-2013 The CryptoNote developers*