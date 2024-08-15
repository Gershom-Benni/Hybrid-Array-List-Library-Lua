local Node = {}
Node.__index = Node

function Node.new(data)
    local self = setmetatable({}, Node)
    self.data = data
    self.next = nil
    return self
end

local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList.new()
    local self = setmetatable({}, LinkedList)
    self.head = nil
    self.tail = nil
    return self
end

function LinkedList:prepend(data)
    local newNode = Node.new(data)
    newNode.next = self.head
    self.head = newNode
    if self.tail == nil then
        self.tail = newNode
    end
end

function LinkedList:append(data)
    local newNode = Node.new(data)
    if self.tail then
        self.tail.next = newNode
        self.tail = newNode
    else
        self.head = newNode
        self.tail = newNode
    end
end

function LinkedList:insertAt(data, position)
    if position < 0 then
        error("Position must be non-negative")
    end
    
    local newNode = Node.new(data)
    
    if position == 0 then
        self:prepend(data)
        return
    end
    
    local current = self.head
    local index = 0
    while current and index < position - 1 do
        current = current.next
        index = index + 1
    end
    
    if not current then
        error("Position out of bounds")
    end
    
    newNode.next = current.next
    current.next = newNode
    
    if newNode.next == nil then
        self.tail = newNode
    end
end

function LinkedList:shift()
    if self.head == nil then
        return
    end
    
    local current = self.head
    self.head = current.next
    if self.head == nil then
        self.tail = nil
    end
    current.next = nil
end

function LinkedList:pop()
    if self.head == nil then
        return
    end
    
    if self.head.next == nil then
        self.head = nil
        self.tail = nil
        return
    end
    
    local prev = self.head
    local current = self.head.next
    while current.next do
        prev = current
        current = current.next
    end
    
    prev.next = nil
    self.tail = prev
end

function LinkedList:deleteAt(position)
    if position < 0 then
        error("Position must be non-negative")
    end
    
    if position == 0 then
        self:shift()
        return
    end
    
    local prev = self.head
    local current = self.head.next
    local index = 1
    
    while current and index < position do
        prev = current
        current = current.next
        index = index + 1
    end
    
    if not current then
        error("Position out of bounds")
    end
    
    prev.next = current.next
    if current.next == nil then
        self.tail = prev
    end
    current.next = nil
end
function LinkedList:printList()
    local current = self.head
    io.write("[")
    if current then
        io.write(current.data)
        current = current.next
    end
    while current do
        io.write(", " .. current.data)
        current = current.next
    end
    io.write("]\n")
end


function LinkedList:index(element)
    local current = self.head
    local index = 0

    while current do
        local dataAsString = tostring(current.data)
        local elementAsString = tostring(element)
        if dataAsString == elementAsString then
            return index
        end

        current = current.next
        index = index + 1
    end

    return -1
end

function LinkedList:elementAt(index)
    if index < 0 then
        error("Index must be non-negative")
    end
    
    local current = self.head
    local currentIndex = 0
    
    while current do
        if currentIndex == index then
            return current.data
        end
        current = current.next
        currentIndex = currentIndex + 1
    end
    
    error("Index out of bounds")
end

function LinkedList:reverse()
    local prev = nil
    local current = self.head
    local next = nil
    self.tail = self.head

    while current do
        next = current.next
        current.next = prev
        prev = current
        current = next
    end
    
    self.head = prev
    if self.tail then
        self.tail.next = nil
    end
end

function LinkedList:sum()
    local total = 0
    local current = self.head

    while current do
        if type(tonumber(current.data)) == "number" then
            total = total + tonumber(current.data)
        else
            print("Warning: Non-numeric data encountered -", current.data)
        end
        current = current.next
    end

    return total
end


function LinkedList:length()
    local current = self.head
    local count = 0
    while current~=nil do
        count = count+1
        current = current.next
    end
    return count
end

function LinkedList:min()
    if not self.head then
        return nil, "List is empty"
    end

    local minValue = self.head.data
    local current = self.head.next

    while current do
        if current.data < minValue then
            minValue = current.data
        end
        current = current.next
    end

    return minValue
end

function LinkedList:max()
    if not self.head then
        return nil, "List is empty"
    end

    local maxValue = self.head.data
    local current = self.head.next

    while current do
        if current.data > maxValue then
            maxValue = current.data
        end
        current = current.next
    end

    return maxValue
end

function LinkedList:average()
    local len = self:length()
    if len == 0 then
        return 0
    end
    local total = self:sum()
    print(len)
    print(total)
    return total / len
end

function LinkedList:merge(otherList)
    if not self.tail then
        self.head = otherList.head
        self.tail = otherList.tail
    else
        self.tail.next = otherList.head
        self.tail = otherList.tail
    end
end

function LinkedList:uniqueify()
    local seen = {}
    local current = self.head
    local prev = nil

    while current do
        if seen[current.data] then
            prev.next = current.next
            if current == self.tail then
                self.tail = prev
            end
        else
            seen[current.data] = true
            prev = current
        end
        current = current.next
    end
end
function LinkedList:clone()
    local newList = LinkedList.new()
    local current = self.head
    while current do
        newList:append(current.data)
        current = current.next
    end
    return newList
end

function LinkedList:toArray()
    local array = {}
    local current = self.head
    while current do
        table.insert(array, current.data)
        current = current.next
    end
    return array
end

function LinkedList:count(value)
    local count = 0
    local current = self.head

    while current do
        if tonumber(current.data) == value then
            count = count + 1
        end
        current = current.next
    end

    return count
end

function LinkedList:join(delimiter)
    local result = {}
    local current = self.head

    while current do
        table.insert(result, tostring(current.data))
        current = current.next
    end

    return table.concat(result, delimiter)
end

function LinkedList:fromArray(array)
    for _, value in ipairs(array) do
        self:append(value)
    end
end



return {
    LinkedList = {
        new = LinkedList.new,
        LinkedList = LinkedList
    }
}
