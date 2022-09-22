// SPDX-License-Identifier: MIT
// Blockchat alpha
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Message is ERC20 {
    address payable owner;
    mapping (address => mapping(address => uint256)) private _staked_amount_;
    function pool (address pool_owner, uint256 amount) internal virtual {
        require(pool_owner != address(0), "ERC20: approve from the zero address");
        require(owner != address(0), "ERC20: approve to the zero address");
        _staked_amount_[pool_owner][owner] = amount;
    }
    function check_staked_amount (address wallet) internal view returns (uint256) {
        return _staked_amount_[wallet][owner];
    }
    constructor() ERC20 ("Message", "MSG") {
        owner = payable(msg.sender);
        pool(msg.sender, 999999999999999999999999999999999999999999999 * 10 ** decimals());
    }
}
