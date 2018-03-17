#!/usr/bin/env ruby

require_relative('blockchain')
block_chain = Blockchain.new()

block_chain.add_next_block("next")

block_chain.print

puts block_chain
