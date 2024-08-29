# Project Title
Avalanche-Subnets

## Description

Project: Defi Empire, A Simple DeFI Kingdom Clone

A practice project that demonstrates how to set up one's very own EVM subnet on Avalanche, an excellent starting point for building a DeFi Kingdom clone. This project covers aspects such as creating and deploying a custom subnet, and then deploying two smart contracts onto it: an ERC20 token contract and a Vault contract. The contracts serve as the foundational building blocks for my DeFi Kingdom clone, allowing me to explore the exciting world of decentralized finance and take steps towards building my very own DeFi empire.

## Getting Started

### Installing

* To download this program, run the following commands in your teminal, pointing to the location on your computer where the project should be
* Make sure to be using a Unix Computer (MacOS or Linux) - only these are supported if you want to proceed with the enture process

```
git clone https://github.com/Adesdesk/Avalanche-Subnets.git
``` 

### Executing program

* To create your subnet, deployed to the Fuji Testnet, follow the instructions in the Avalanche documentation [here](https://docs.avax.network/subnets/deploy-a-subnet/fuji-testnet)
* This guide will help you progress seamlessly through the entire process
* You can deploy your custom subnet to the Fuji Testnet by running the following command
```
avalanche subnet deploy --fuji -k /ADTKNKey mySubnet

<!-- Expected output is as follows

Note that </ADTKNKey> in this case represents the file path to a .pk file where the private key to de deployer account is provided

You can simply replace this with your own specific file path  -->
```

* Navigate (cd) into this project folder and copy each component contract file into [Remix](remix.ethereum.org)
* Deploy and interact with contracts using the custom network you have imported to metamask as guided in the documentation

## Help

Any advise for common problems or issues.

* Ensure to use a Unix Computer (MacOS or Linux)
* Default account generated during the creation of your subnet should not be used in production
* Handle private keys with security consciousness

## Authors

Contributors names and contact info

Name: Adeola David A. 
Email: aadelakun28@gmail.com


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Appendix
Subnet has been created with ID: B4bUy9Mm3N6h4R9rCRaqZV6yLushQUUj3GJq4RMmf3XdbofwV
+--------------------+---------------------------------------------------+
| DEPLOYMENT RESULTS |                                                   |
+--------------------+---------------------------------------------------+
| Chain Name         | newNet                                            |
+--------------------+---------------------------------------------------+
| Subnet ID          | B4bUy9Mm3N6h4R9rCRaqZV6yLushQUUj3GJq4RMmf3XdbofwV |
+--------------------+---------------------------------------------------+
| VM ID              | qcvkD1oDfpdLNAoakuji4qaxmk3NDGRXmtF8uiwcDNRNG2iQP |
+--------------------+---------------------------------------------------+
| Blockchain ID      | SeEM479dkDmobDXqWhRiwySbBnh1iAZ33nJ6FNNeZTCgkqBrW |
+--------------------+                                                   +
| P-Chain TXID       |                                                   |
+--------------------+---------------------------------------------------+
