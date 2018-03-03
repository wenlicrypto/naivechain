require_relative 'block'

class Blockchain
  attr_accessor :chain
  def initialize
    @chain = [Block.get_genesis_block()]
  end
end
