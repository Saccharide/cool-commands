# Rust

* Rust Ternary Operation (Basically just a shortform if and else \u{1F602})
```rust
if a > b {return a} else {return b};
or
return if a > b {a} else {b}
```

## Loop
* Infinite loop
```rust
let mut count = 0;
loop {
    count += 1;
    if count >= 20 {
        break
    }
}
```

* For loop
```rust
for x in 0..100 {
    println!("{}", x)
}
```

* Use `->` to indicate return in function header, don't have to write `return`!!!
```rust
fn add(a: i32, b:i32) -> i32 {
    a + b
}
```

* Lambda Expression (closure) in rust, can use variables in current scope instead of needing to create a global variable in the case of a function call
```rust
let c = 10
let add = |a:i32, b:i32| a + b + c
println!("Sum = {}", add(1,2))
```

* Vectors in rust, 
```rust
let vec1 = vec![1,2,3];
let mut vec2: Vec<i32> = vec![1,2,3];
vec2.push(4);
for x in vec2.iter() // loop
```

* Format, same as `println` but doesn't print
```rust
format!("{}", STRING)
```

* `match`, basically a `switch` in python, `=>` indicates code to run when matched the specified enum
```rust
match enum{
    ENUM::a => println!("a")
}
```

* Use some build in `std` to get command line argument, with `0` position indicating the path to the binary
```rust
use std::env
let args: Vec<String> = env::args().collect();
let commnad = args[1].clone();
```

* Slicing an array
```rust
let a = [0,1,2,3,4,5];
let slice = &a[1..4];
```

* Iterate a vector and perform a function to each element
```rust
let nums = vec![16, 9, 4, 1];
let res  = nums.into_iter().map(|x| sqrt(x));
let x = res.collect::<Result<Vec<i32>,DivisionError>>();
let y = res.collect::<Vec<Result<i32,DivisionError>>();
```

* Iterator function `fold`, takes two parameters, first is initial value, second is a closure with two arguments: accumulator variable and next element in vector
```rust
(1..num+1).fold(1, |acc, x| acc + x)
```

* Get the result from a `Result` using `unwrap`
```rust
let a = "20";
println!("{:?}", a.parse::<i32>().unwrap());
```
