#https://www.codewars.com/kata/51fda2d95d6efda45e00004e/train/ruby

class User
  def initialize
    @rank = -8
    @progress = 0
  end
  def rank
    @rank
  end
  def progress
    @progress
  end
  def set_rank(rank)
    @rank = rank
  end
  def increase_rank
    if @rank < 8
      @rank += 1
    end
    if @rank == 0
      @rank = 1
    end
  end
  #returns amount of progress
  def inc_progress(activity_rank)
    #diff = (@rank - activity_rank).abs
    ranks = [-8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8]
    true_diff = ranks.index(activity_rank) - ranks.index(@rank)
    if true_diff < 0
      if true_diff <= -2
        nil
      else
        @progress += 1
      end
    elsif true_diff == 0
      @progress += 3
    else
      @progress += (10*true_diff*true_diff)
    end
    while @progress >= 100
      self.increase_rank
      @progress -= 100
    end
  end
end


RSpec.describe "init user" do
  it "should init user at rank -8" do
    expect(User.new.rank).to eq -8
  end
end
RSpec.describe "rank" do
  it "should rank past 0 max 8" do
    x = User.new
    x.set_rank(-1)
    x.increase_rank
    expect(x.rank).to eq 1
    x.set_rank(8)
    x.increase_rank
    expect(x.rank).to eq 8
  end
end
RSpec.describe "inc_progress" do
  it "should increase progress" do
    x = User.new
    x.inc_progress(-8)
    expect(x.progress).to eq 3
  end
end
RSpec.describe "inc_progress" do
  it "should increase rank if progress > 100" do
    x = User.new
    x.inc_progress(-4)
    expect(x.rank).to eq -7
    expect(x.progress).to eq 60
  end
end
RSpec.describe "inc_progress" do
  it "should ignore zero case (diff between -1 and 1 is 1)" do
    x = User.new
    x.set_rank(-1)
    x.inc_progress(1)
    expect(x.progress).to eq 10
  end
end
RSpec.describe "inc_progress" do
  it "shouldnt allow user to progress past level 8" do
    x = User.new
    x.set_rank(8)
    100.times do
      x.inc_progress(8)
    end
    expect(x.rank).to eq 8
  end
end
RSpec.describe "inc progress" do
  it "should handle rank 8 on first go" do
    x = User.new
    x.inc_progress(8)
    expect(x.progress).to eq 0
  end
end
