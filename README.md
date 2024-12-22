## EFUNC-- A GAMESENSE LUA FUNCTION LIBRARY
### USAGE
Put efunc.lua in your steam\steamapps\common\Counter-Strike Global Offensive folder
##### dont load it, instead, add this to your lua
```
local efunc = require("efunc")
```
### FEATURES
Functions include:
* efunc.include(array): return whether an array include a value
* efunc.table_visibility(table): set the visibility of a table of gamesense menu objects
* efunc.sort_pair(a, b): sort two objects from small to big
* efunc.shuffle(a, b): generate a shuffled sequence from a to b
* efunc.ui_set_array(element, array): set a color pick or a multiselect with a given array that stores its value
* efunc.normalize(angle): normalizes a angle to -180~180
* efunc.sort(arr): sort an array fastly
* efunc.deepcopy(orig): deep copy (copy a deep and complicated table with full accuracy)
* efunc.array_unique(arr): remove repeated elements from an array
* efunc.array_merge(arr1, arr2): merge to arrays
* efunc.string_contains(str, substr): return whether a string contains another string
* efunc.table_is_empty(tab): return whether a table is empty
* efunc.is_prime(n): return whether a number is a prime number
* efunc.clamp(val, min, max): clamp function, return val if it's within min and max, or return its closest limit
* efunc.table_count(tab): calculate the length of a table (like #array)
