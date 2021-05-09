require "../spec_helper"

describe "Year2016::Day1::Solver" do
  describe "#parse" do
    it "should remove leading and trailing whitespaces" do
      Year2016::Day1::Solver.new.parse(" L123").should eq({Year2016::Day1::Directions::Left, 123})
      Year2016::Day1::Solver.new.parse("L123 ").should eq({Year2016::Day1::Directions::Left, 123})
      Year2016::Day1::Solver.new.parse("  L123  ").should eq({Year2016::Day1::Directions::Left, 123})
    end

    it "should separate a command into two components" do
      Year2016::Day1::Solver.new.parse("L123").should eq({Year2016::Day1::Directions::Left, 123})
    end
  end

  describe "#run_1" do
    it "Gives the correct solution for problem 1 for my dataset" do
      Year2016::Day1::Solver.new.run_1.should eq 253
    end
  end

  describe "#run_2" do
    it "Gives the correct solution for problem 2 for my dataset" do
      Year2016::Day1::Solver.new.run_2.should eq 126
    end
  end
end
