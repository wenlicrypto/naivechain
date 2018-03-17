require_relative 'block'

class Blockchain
  attr_accessor :chain
  def initialize
    @chain = [Block.get_genesis_block()]
  end

  def get_last_block
    @chain[-1]
  end

  def generate_new_block(previous_block, data)
      previous_hash = previous_block.current_hash
      index = previous_block.index + 1
      timestamp = Time.now.to_i
      data = data

      block = Block.new(index, previous_hash, timestamp, data)

      return block
  end

  def add_block(block)
    @chain.push(block)
  end

  def add_next_block(data)
    previous_block = get_last_block()
    data = data

    @chain.push(generate_new_block(previous_block, data))
  end

  def print
    @chain.each do |block|
      puts "******Block #{block.index}******"
      puts "Previous Hash: #{block.previous_hash}"
      puts "Current Hash: #{block.current_hash}"
      puts "Timestamp: #{block.timestamp}"
      puts "data: #{block.data}"
      puts "********End********"
      puts ""
    end
  end
end
