# HybridArrayList Library

The `HybridArrayList` library provides a Lua implementation of a data structure that combines features of both linked lists and arrays. This versatile structure supports various operations such as insertion, deletion, and traversal while offering the benefits of dynamic resizing.

## Features

- **Prepend**: Add elements to the beginning of the list.
- **Append**: Add elements to the end of the list.
- **Insert at Position**: Insert elements at a specified position.
- **Delete at Position**: Remove elements from a specified position.
- **Shift**: Remove the first element.
- **Pop**: Remove the last element.
- **Print List**: Display the list elements.
- **Index**: Find the index of a specific element.
- **Element at Index**: Retrieve the element at a specific index.
- **Reverse**: Reverse the order of elements in the list.
- **Sum**: Calculate the sum of all numeric elements.
- **Length**: Get the number of elements in the list.
- **Min**: Find the minimum value in the list.
- **Max**: Find the maximum value in the list.
- **Average**: Calculate the average of numeric elements.
- **Merge**: Combine another `HybridArrayList` into the current list.
- **Uniqueify**: Remove duplicate elements from the list.
- **Clone**: Create a duplicate of the current list.
- **ToArray**: Convert the list to a standard Lua array.
- **Count**: Count occurrences of a specific value.
- **Join**: Join all elements into a string with a specified delimiter.
- **FromArray**: Initialize the list with elements from a standard Lua array.

## Installation

Simply copy and paste the `HybridArrayList` code into your Lua environment. No additional installation steps are required.

## Example Usage

```lua
local HybridArrayList = require('HybridArrayList').HybridArrayList

-- Create a new HybridArrayList
local list = HybridArrayList.new()

-- Add elements to the list
list:append(1)
list:append(2)
list:prepend(0)

-- Print the list
list:printList()  -- Output: [0, 1, 2]

-- Insert an element at a specific position
list:insertAt(3, 2)
list:printList()  -- Output: [0, 1, 3, 2]

-- Remove the first element
list:shift()
list:printList()  -- Output: [1, 3, 2]

-- Remove the last element
list:pop()
list:printList()  -- Output: [1, 3]

-- Find the index of an element
local index = list:index(3)
print(index)  -- Output: 1

-- Get the element at a specific index
local element = list:elementAt(0)
print(element)  -- Output: 1

-- Reverse the list
list:reverse()
list:printList()  -- Output: [3, 1]

-- Calculate the sum of numeric elements
local sum = list:sum()
print(sum)  -- Output: 4

-- Find the minimum value
local minValue = list:min()
print(minValue)  -- Output: 1

-- Find the maximum value
local maxValue = list:max()
print(maxValue)  -- Output: 3

-- Calculate the average of numeric elements
local average = list:average()
print(average)  -- Output: 2

-- Merge with another list
local anotherList = HybridArrayList.new()
anotherList:append(4)
anotherList:append(5)
list:merge(anotherList)
list:printList()  -- Output: [3, 1, 4, 5]

-- Remove duplicates
list:uniqueify()
list:printList()  -- Output: [3, 1, 4, 5]

-- Clone the list
local clonedList = list:clone()
clonedList:printList()  -- Output: [3, 1, 4, 5]

-- Convert to array
local array = list:toArray()
print(table.concat(array, ", "))  -- Output: 3, 1, 4, 5

-- Count occurrences of a value
local count = list:count(1)
print(count)  -- Output: 1

-- Join elements into a string
local joined = list:join(", ")
print(joined)  -- Output: 3, 1, 4, 5

-- Initialize list from an array
local newList = HybridArrayList.new()
newList:fromArray({10, 20, 30})
newList:printList()  -- Output: [10, 20, 30]

## License

This library is provided under the MIT License. See the [LICENSE](LICENSE) file for more information.


