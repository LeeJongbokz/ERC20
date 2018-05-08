const MyTokenCrowdsale = artifacts.require('./MyTokenCrowdSale.sol');

const MyToken = artifacts.require('./MyToken.sol');



module.exports = function(deployer, network, accounts) {

    const openingTime = Date(2018, 4, 9, 0, 0); 
    const closingTime = openingTime + 86400 * 2 + 39600; 
    const rate = new web3.BigNumber(1000);
    const wallet = accounts[1];

    return deployer

        .then(() => {

            return deployer.deploy(MyToken);

        })

        .then(() => {

            return deployer.deploy(

                MyTokenCrowdSale,

                openingTime,

                closingTime,

                rate,

                wallet,

                MyToken.address

            );

        });

};