require "../spec_helper"

describe Year2020::Day1::Solver do
  describe "#run_1" do
    it "Gives the correct solution for problem 1 for actual data" do
      Year2020::Day1::Solver.new.run_1.should eq 1014624
    end
  end

  describe "#run_2" do
    it "Gives the correct solution for problem 2 for my dataset" do
      Year2020::Day1::Solver.new.run_2.should eq 80072256
    end
  end
end
