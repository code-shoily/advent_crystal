require "../spec_helper"

describe "Year2015::Day1::Solver" do
  describe "#run_1" do
    it "Gives the correct solution for problem 1 for my dataset" do
      Year2015::Day1::Solver.new.run_1.should eq 232
    end
  end

  describe "#run_2" do
    it "Gives the correct solution for problem 2 for my dataset" do
      Year2015::Day1::Solver.new.run_2.should eq 1783
    end
  end
end
