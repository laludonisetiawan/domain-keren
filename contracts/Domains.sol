// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    mapping (string => address) public domains; // Tipe data "pemetaan" untuk menyimpan nama mereka
    mapping (string => string) public records; // mapping untuk menyimpan nilai 
    
    constructor() {
        console.log("halo bang ini adalah contract untuk domain saya, keren bukan? bukan!");
    }

    // Fungsi register yang menambahkan namanya ke Mapping kita
    function register (string calldata name) public {
        require(domains[name] == address(0)); // periksa apakah namanya tidak terdaftar, jadi jika domain belum d terdaftar akan merujuk ke angka nol. 
        domains[name] = msg.sender;
        console.log("%s telah mendaftarkan domain!", msg.sender);
    }

    // Ini akan memberi kami alamat pemilik domain
    function getAddress(string calldata name) public view returns (address) {
        return domains[name]; // cek apakah pengirim transaksi adalah alamat yang memiliki domain tersebut.
    }

    // fungsi getRecord untuk memberikan nilai 
    function setRecord(string calldata name, string calldata record) public  {
        // periksa apakah pemiliknya yang mengirimkan transaksi 
        require(domains[name] == msg.sender);
        records[name] = record;
    }

    function getRecord(string calldata name) public view returns(string memory) {
        return records[name];
    }
}