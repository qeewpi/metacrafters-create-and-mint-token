require("dotenv").config(); // Load environment variables from .env file
const { ethers, network } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Retrieve environment variables
  const infuraProjectId = process.env.INFURA_PROJECT_ID;
  const privateKey = process.env.PRIVATE_KEY;
  const initialOwner = process.env.INITIAL_OWNER_ADDRESS;

  if (!infuraProjectId || !privateKey || !initialOwner) {
    throw new Error(
      "Missing environment variables. Make sure INFURA_PROJECT_ID, PRIVATE_KEY, and INITIAL_OWNER_ADDRESS are set in .env file."
    );
  }

  // Dynamically set up ethers provider using Infura based on the Hardhat network configuration
  const provider = new ethers.providers.InfuraProvider(
    "sepolia",
    infuraProjectId
  );
  const wallet = new ethers.Wallet(privateKey, provider);

  // Deploy MyToken contract with the initialOwner address
  const MyToken = await ethers.getContractFactory("MyToken");
  const myToken = await MyToken.connect(wallet).deploy(initialOwner);

  console.log("MyToken deployed to:", myToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
