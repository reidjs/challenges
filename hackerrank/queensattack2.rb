
#n,k = gets.strip.split(' ')
# require 'spec_helper'
n = 3
k = 0
n = n.to_i
k = k.to_i
#rQueen,cQueen = gets.strip.split(' ')
rQueen = 4
cQueen = 4
rQueen = rQueen.to_i
cQueen = cQueen.to_i
#for now, try with zero obstacles
for a0 in (0..k-1)
    rObstacle,cObstacle = gets.strip.split(' ')
    rObstacle = rObstacle.to_i
    cObstacle = cObstacle.to_i
    # your code goes here
end
class Board
  attr_reader :size, :cells
  #@cells
  #queen row and column

  def initialize(size, qr=0, qc=0)
    @size = size
    @cells = []
    for i in 0..size**2-1
      @cells << Cell.new(i) #make N * N Cells
    end
    for i in 0..size-1
      for j in 0..size-1
        if i == qr && j == qc
          @cells[i*size+j].queen = true
        else
          @cells[i*size+j].queen = false
        end
        thiscell = @cells[i*size+j]
        rightcell = @cells[i*size+j+1]
        leftcell = @cells[i*size+j-1]
        downcell = @cells[i*size+j+size]
        upcell = @cells[i*size+j-size]
        downrightcell = @cells[i*size+j+size+1]
        downleftcell = @cells[i*size+j+size-1]
        uprightcell = @cells[i*size+j-size+1]
        upleftcell = @cells[i*size+j-size-1]

        notonleftcolumn = (i*size + j) % size != 0
        notonrightcolumn = (i*size + j) % size != size-1
        notontoprow = (i*size + j) >= size
        notonbottomrow = (i*size + j) < (size*size - size)
        #We cannot simply assign directions without checking because some numbers my be negative and we don't
        #want it to wrap around
        #orthogonal directions
        thiscell.right = rightcell if notonrightcolumn
        thiscell.left = leftcell if notonleftcolumn
        thiscell.up = upcell if notontoprow
        thiscell.down = downcell if notonbottomrow
        #diagonals
        thiscell.downleft = downleftcell if (notonleftcolumn && notonbottomrow)
        thiscell.upleft = upleftcell if (notontoprow && notonleftcolumn)
        thiscell.downright = downrightcell if (notonbottomrow && notonrightcolumn)
        thiscell.upright = uprightcell if (notontoprow && notonrightcolumn)
      end
    end
  end
end
class Cell
  attr_accessor :right, :left, :down, :up, :downright, :downleft, :upleft, :upright, :queen
  attr_reader :id
  #@id
  def initialize(id)
    @id = id
  end
end
def count_cells_in_direction(cell, sym)
  count = 0
  while !cell.send(sym).nil?
    cell = cell.send(sym)
    count+=1
  end
  count
end
#WARNING: The problem is doing everything 1 indexed, not 0 indexed
RSpec.describe Board do
  n = 3
  b = Board.new(n)
  it "creates correct # cells" do
    expect(b.cells.length).to eq n**2
  end
  it "links cells correctly" do
    n = 3
    b = Board.new(n)
    expect(b.cells[0].left).to eq nil
    expect(b.cells[0].right).to_not be_nil
    expect(b.cells[1].left).to eq b.cells[0]
    expect(b.cells[2].right).to eq nil
    expect(b.cells[3].left).to eq nil
    expect(b.cells[4].left).to eq b.cells[3]
    expect(b.cells[4].right).to eq b.cells[5]
    expect(b.cells[4].up).to eq b.cells[1]
    expect(b.cells[4].down).to eq b.cells[7]
    expect(b.cells[0].down).to eq b.cells[3]
    expect(b.cells[2].down).to eq b.cells[5]
  end
  it "places queen on given cell" do
    n = 3
    b = Board.new(n, 1, 1)
    expect(b.cells[4].queen).to eq true
    expect(b.cells[2].queen).to eq false
    expect(b.cells[1].queen).to eq false
    expect(b.cells[5].queen).to eq false
  end
  it "can count the number of spaces in any direction" do
    n = 3
    b = Board.new(n)
    expect(count_cells_in_direction(b.cells[0], :down)).to eq 2
    expect(count_cells_in_direction(b.cells[0], :up)).to eq 0
    expect(count_cells_in_direction(b.cells[4], :up)).to eq 1
    expect(count_cells_in_direction(b.cells[8], :up)).to eq 2
    expect(count_cells_in_direction(b.cells[7], :up)).to eq 2
    expect(count_cells_in_direction(b.cells[7], :upright)).to eq 1
    expect(count_cells_in_direction(b.cells[8], :upright)).to eq 0
    expect(count_cells_in_direction(b.cells[3], :upright)).to eq 1
    expect(count_cells_in_direction(b.cells[3], :downright)).to eq 1
  end
end
# y = Cell.new
# x.right = y
#
# p x.right
# p x.left
# p x == x.right
# p y.left
