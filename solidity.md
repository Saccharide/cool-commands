# Notes for solidity
* Convert a series of `string` into a `byte32[]`
```
function getBytes32ArrayForInput() pure public returns (bytes32[3] b32Arr) {
    return [bytes32("candidate 1"), bytes32("candidate 2"), bytes32("candidate 3")];
}
```
* An example of `byte32[]` is: `["0x63616e6469646174652031000000000000000000000000000000000000000000", "0x63616e6469646174652032000000000000000000000000000000000000000000", "0x63616e6469646174652033000000000000000000000000000000000000000000"]`

* cast a `string` to `address`, actually pretty simple, BUT, make sure capitalization is correct, or else there will be problem with compiler.
```
address _address = 0xa7177777f7563Fab5C8E4c98a4fB7A21416be12d;
```
