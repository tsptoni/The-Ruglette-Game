pragma solidity >=0.4.25 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/TheRugletteGamblingToken.sol";

contract TestTheRugletteGamblingToken {

  function testInitialBalanceUsingDeployedContract() public {
    TheRugletteGamblingToken guns = TheRugletteGamblingToken(DeployedAddresses.TheRugletteGamblingToken());

    uint expected = 10000 * (10 ** 9);

    Assert.equal(guns.balanceOf(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  event Log(
    address _message
  );

  function testInitialBalanceWithNewMetaCoin() public {
    TheRugletteGamblingToken guns = new TheRugletteGamblingToken();

    uint expected = 0;

    emit Log(tx.origin);

    Assert.equal(guns.balanceOf(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

}
