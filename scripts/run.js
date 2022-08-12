const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const domainContractFactory = await hre.ethers.getContractFactory('Domains');
    const domainContract = await domainContractFactory.deploy();
    await domainContract.deployed();
    console.log("Contract disebarkan ke :", domainContract.address);
    console.log("Contract disebarkan oleh:", owner.address); //untuk melihat orang yang menyebarkan kontrak kami

    let txn = await domainContract.register("doom");
    await txn.wait();

    const domainOwner = await domainContract.getAddress("doom");
    console.log("Pemilik domain:", domainOwner);
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