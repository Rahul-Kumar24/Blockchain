pragma solidity ^0.5.0;

import "./DaiToken.sol";
import "./DappToken.sol";

contract TokenFarm {
          string public name = "Dapp Token Farm";
          DappToken public dappToken;
          DaiToken public daiToken;

          address[] public stakers;
          mapping(address =>uint) public stakingBalance;
          mapping(address =>bool) public hasStaked;
          mapping(address => bool) public isStaking;
          constructor(DappToken _dappToken, DaiToken _daiToken) public {
                    dappToken = _dappToken;
                    daiToken = _daiToken;
          }

          // 1 Stakes Token (Depposit)

          function stakeTokens(uint _amount) public {


                    daiToken.transferFrom(msg.sender, address(this), _amount);

                    // Update staking balanceOf

                    stakingBalance[msg.sender]=stakingBalance[msg.sender]+_amount;

                    // Add user to stakers array "only" if they have't staked already.

                    if(!hasStaked[msg.sender]){
                              stakers.push(msg.sender);
                    }

                    // Update staking status
                    isStaking[msg.sender]=true;
                    hasStaked[msg.sender] = true;
          }

          // 2 Unstaking Token (withdraw)


          //3 Issuing Tokens
          function issueToken() public{
                    for ( uint i=0; i<stakers.length; i++){
                              address = recipient = stakers[i];
                              uint blance = stakingBalance[recipient];
                    }
          }
}