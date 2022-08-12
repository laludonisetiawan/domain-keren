// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    // Tipe data "pemetaan" untuk menyimpan nama mereka
    mapping (string => address) public domains;
    constructor() {
        console.log("halo bang ini adalah contract untuk domain saya, keren bukan? bukan!");
    }

    // Fungsi register yang menambahkan namanya ke pemetaan kita
    function register (string calldata name) public {
        domains[name] = msg.sender;
        console.log("%s telah mendaftarkan domain!", msg.sender);
    }

    // Ini akan memberi kami alamat pemilik domain
    function getAddress(string calldata name) public view returns (address) {
        return domains[name];
    }
}