# Godot RngUtils

Random number generation utils for the Godot 4

<!-- TOC -->
* [Godot RngUtils](#godot-rngutils)
  * [Features](#features)
  * [Installation](#installation)
  * [Usage](#usage)
    * [Random integer range](#random-integer-range)
    * [Random float range](#random-float-range)
    * [Random item(s) from an array](#random-item--s--from-an-array)
    * [Random item(s) from an array with weighted](#random-item--s--from-an-array-with-weighted)
<!-- TOC -->

## Features

- Random integer range
- Random float range
- Random item(s) from an array
- Random item(s) from an array with weighted

## Installation

1. Clone or download a copy of this repository.
2. Enable the addon in the project settings.
3. Restart Godot IDE.

## Usage

### Random integer range

`int_range(from: int, to: int, rng: RandomNumberGenerator = null) -> int`

Returns a pseudo-random integer between from and to (inclusive)

```gdscript
RngUtils.int_range(1, 100)
# output: 89
```

### Random float range

`float_range(from: float, to: float, rng: RandomNumberGenerator = null)`

Returns a pseudo-random float between from and to (inclusive)

```gdscript
RngUtils.float_range(0.1, 5.1)
# output: 3.89661073684692
```

### Random item(s) from an array

`array(array: Array, num: int = 1, unique: bool = false, rng: RandomNumberGenerator = null) -> Array`

Returns one or multiple random items from an array

```gdscript
var array := ["a", "b", "c", "d"]
# random one item
RngUtils.array(array)
# output: ["a"]

# random four items(not unique)
RngUtils.array(array, 4)
# output: ["d", "d", "d", "c"]

# random four items(unique)
RngUtils.array(array, 4, true)
# output: ["c", "b", "a", "d"]
```

### Random item(s) from an array with weighted

`array_with_weighted(weights: Array[Dictionary], num: int = 1, unique: bool = false, rng: RandomNumberGenerator = null) -> Array[Dictionary]`

- Dictionary key `weight` require
- Returns one or multiple random items from an array with weighted

```gdscript
var weights: Array[Dictionary] = [
    {"value":"a","txt": "apple", "weight": 5.0},
    {"value":"b", "weight": 10.0},
    {"value":"c", "weight": 20.0},
    {"value":"d", "weight": 40.0},
    {"value":"e", "weight": 25.0},	
]

# random one item
RngUtils.array_with_weighted(weights, 1)
# output: [{ "value": "c", "weight": 20 }]

# random four items(not unique)
RngUtils.array_with_weighted(weights, 4)
# output: [{ "value": "c", "weight": 20 }, { "value": "d", "weight": 40 }, { "value": "e", "weight": 25 }, { "value": "d", "weight": 40 }]

# random four items(unique)
RngUtils.array_with_weighted(weights, 4, true)
# output: { "value": "d", "weight": 40 }, { "value": "c", "weight": 20 }, { "value": "a", "txt": "apple", "weight": 5 }, { "value": "b", "weight": 10 }]
```
