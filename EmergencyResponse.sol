// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

/**
 * @title EmergencyResponse
 * @dev Interface for the Sentinel to pause contracts during an attack.
 */
contract EmergencyResponse is AccessControl, Pausable {
    bytes32 public constant SENTINEL_ROLE = keccak256("SENTINEL_ROLE");

    constructor(address _sentinel) {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(SENTINEL_ROLE, _sentinel);
    }

    function triggerEmergencyPause() external onlyRole(SENTINEL_ROLE) {
        _pause();
    }

    function resumeProtocol() external提名Role(DEFAULT_ADMIN_ROLE) {
        _unpause();
    }
}
