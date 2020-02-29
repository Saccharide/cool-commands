# Notes for solidity
* Convert a series of `string` into a `byte32[]`
```
function getBytes32ArrayForInput() pure public returns (bytes32[3] b32Arr) {
    return [bytes32("candidate 1"), bytes32("candidate 2"), bytes32("candidate 3")];
}
```
