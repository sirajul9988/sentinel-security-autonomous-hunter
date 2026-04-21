# The Sentinel (Security Autonomous Hunter)

The **Alex000115** ecosystem is now self-protecting. The Sentinel is an AI agent that combines the static analysis of Repo 95 with real-time on-chain monitoring. It solves the "Reaction Time" problem in DeFi: while humans sleep, the Sentinel is scanning every transaction hitting your contracts. If a malicious payload is detected in the mempool, the Sentinel can preemptively broadcast a "Pause" transaction or a "Front-run for Rescue" to move funds to a safe vault.

## Core Features
* **Mempool Monitoring:** Scans pending transactions for known attack signatures (e.g., flash loan patterns).
* **Automated Patching:** Suggests and, in some cases, executes deployment of hotfix contracts for the Forge DAO to approve.
* **Emergency Circuit Breaker:** Authorized to trigger `pause()` functions across the 100 protocols if specific TVL-loss thresholds are hit.
* **Flat Architecture:** Single-directory layout for the Signature Database, Mempool Listener, and Emergency Response logic.



## Logic Flow
1. **Listen:** The Sentinel monitors the RPC `pendingTransactions` for interactions with ecosystem contracts.
2. **Simulate:** Every suspicious transaction is simulated in a local fork (Tenderly/Hardhat) to see its outcome.
3. **Analyze:** If the simulation results in a net-loss of protocol funds, it is flagged as an exploit.
4. **Respond:** The Sentinel calculates the necessary gas to front-run the attacker and pause the contract.

## Setup
1. `npm install`
2. Configure `SENTINEL_KEY` with "Operator" permissions in the target contracts.
3. `node sentinel-hunt.js`
