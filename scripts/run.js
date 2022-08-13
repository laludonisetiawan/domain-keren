const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners(); // Pengembalian pertama adalah penyebar, yang kedua adalah akun acak
    const domainContractFactory = await hre.ethers.getContractFactory('Domains');
    const domainContract = await domainContractFactory.deploy();
    await domainContract.deployed();
    console.log("Contract disebarkan ke :", domainContract.address);
    console.log("Contract disebarkan oleh:", owner.address); //untuk melihat orang yang menyebarkan kontrak kami

    let txn = await domainContract.register("doom");
    await txn.wait();

    const domainAddress = await domainContract.getAddress("doom");
    console.log("Pemilik domain doom:", domainAddress);


  // Mencoba membuat rekor yang bukan milikku!
  tnx = await domainContract.connect(randomPerson).setRecord("doom", "Haha domain saya sekarang!");
  await txn.wait();
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();