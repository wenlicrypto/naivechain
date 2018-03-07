require 'digest'

class Block
  attr_reader :index, :previous_hash, :timestamp, :data, :current_hash

  def initialize(index, previous_hash, timestamp, data)
    @index = index
    @previous_hash = previous_hash
    @timestamp = timestamp
    @data = data
    @current_hash = calculate_hash()
  end

  def self.get_genesis_block()
    return Block.new(0, '0', '0', "The first block")
  end

  def calculate_hash()
    value = "#{@index}#{@previous_hash}#{@timestamp}#{@data}"

    Digest::SHA256.hexdigest(value)
  end
end
