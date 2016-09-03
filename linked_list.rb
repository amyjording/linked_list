class LinkedList
  attr_reader :size

  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
      @next = nil
    end

  end

  def initialize
    @head = nil
    @tail = nil
    @new_node = nil
    @size = 0
    control_panel
  end

  def control_panel
    puts
    puts "Welcome to your new linked list.",""
    command = ""

    while command != 8
      puts
      puts "Would you like to (1) append, (2) prepend, (3) add at an index, (4) remove at an index, (5) find, (6) contains"
      puts "Or select 8 to quit.",""
      printf "Select 1-6: "
      command = gets.chomp.to_i

      case command
      when 8 then puts "Okay, thanks, bye.",""
        when 1 then append
        when 2 then prepend
        when 3 then insert_at
        when 4 then remove_at
        when 5 then find?
        when 6 then contains?
        else
          puts "Sorry, I don't know how to #{command}"
      end
    end
    puts "Here is your completed linked list: #{to_string}"
    puts "List size: #{size}"
    puts "List head: #{head}"
    puts "List tail: #{tail}"
  end

  def add_node
    puts "What would you like to put in your new node?",""
    input = gets.chomp.to_s
    @new_node = Node.new(input)
  end

  def first_node
    @head = @new_node
    @tail = @head
  end

  def append
    add_node
    @size += 1

    if @head.nil?
      first_node
    else
      @tail.next = @new_node
      @tail = @tail.next
    end
    puts to_string
  end

  def prepend
    add_node
    @size += 1

    if @head.nil?
      first_node
    else
      @new_node.next = @head
      @head = @new_node
    end
    puts to_string
  end

  def valid_index
    puts to_string
    puts "Please enter index number you wish to insert your new data.",""
    index = gets.chomp.to_i

    while index > @size || index < 0
      print "Please try another index number: "
      index = gets.chomp.to_i
    end
    return index
  end

  def insert_at
    index = valid_index
    add_node
    placer = @head
    i = 0
    until i == index
      placer = placer.next
      i += 1
    end

    placer2 = placer.next
    placer.next = @new_node
    @new_node.next = placer2
    @tail = placer.next if index == @size-1

    puts to_string
  end

  def contains?
    puts "What are you looking for?"
    value = gets.chomp.to_s
    placer = @head
    until placer.nil?
      puts true if placer.value == value
      puts false if placer.value != value
      placer = placer.next
    end
    false
  end

  def remove_at
    index = valid_index
    placer = @head
    i = 0

    if index == 0
      @head = @head.next
      return
    elsif index == @size-1
      pop()
      return
    end
    until i == index-1
      placer = placer.next
      i += 1
    end
    placer.next = placer.next.next

    puts to_string
  end

  def pop
    placer = @head
    until placer.next = @tail
      placer = placer.next
    end
    @tail = placer
    @tail.next = nil
  end

  def find?
    puts "What are you looking for?"
    value = gets.chomp.to_s

    placer = @head
    index = 0

    until placer.nil?
      puts "Find: #{index}" if placer.value == value
      index += 1
      placer = placer.next
    end
    nil
  end

  def size
    @size
  end

  def to_string
    placer = @head
    out = ""

    until placer == nil
      out += "[ #{placer.value} ] ->"
      placer = placer.next
    end
    out += ("nil")
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

end

my_list = LinkedList.new
