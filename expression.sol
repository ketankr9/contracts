pragma solidity ^0.4.18;
contract Expression {
  
  mapping( address => bytes32[] ) internal userMessages;
  
  function sendMessage(bytes32 _message) external {
    userMessages[msg.sender].push(_message);
  }

  function getMessageByOwner(address _add) public view returns(bytes32[]) {
    return userMessages[_add];
  }
  
  
  function getMyMessage() public view returns(bytes32[]) {
    return userMessages[msg.sender];
  }
  
  
  function test() external view returns(bytes32){
    bytes32 test = "0x6f6b546573746564";
    return test;
  }


    // helper function
    function bytes32ToString(bytes32 x) constant internal returns (string) {
    bytes memory bytesString = new bytes(32);
    uint  charCount = 0;
    for (uint  j = 0; j < 32; j++) {
        byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
        if (char != 0) {
            bytesString[charCount] = char;
            charCount++;
        }
    }
    bytes memory bytesStringTrimmed = new bytes(charCount);
    for (j = 0; j < charCount; j++) {
        bytesStringTrimmed[j] = bytesString[j];
    }
    return string(bytesStringTrimmed);
    }
}
