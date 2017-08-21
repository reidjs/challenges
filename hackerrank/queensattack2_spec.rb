require 'spec_helper'
require 'queensattack2.rb'
describe Board do
  b = Board.new(3)
  b.cells.length.should be == 17
end
