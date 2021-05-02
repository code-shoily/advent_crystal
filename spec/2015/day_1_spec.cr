require "../spec_helper"

describe Year2015::Day1::Solver, "Final run" do
  describe "#run_1" do
    it "Gives the correct solution for problem 1 for example data" do
      parameters = [
        {"(())", 0},
        {"()()", 0},
        {"(((", 3},
        {"(()(()(", 3},
        {"))(((((", 3},
        {"())", -1},
        {"))(", -1},
        {")))", -3},
        {")())())", -3},
      ]

      parameters.map { |(input, output)|
        solver = Year2015::Day1::Solver.new(input)
        solver.run_1.should eq output
      }
    end

    it "Gives the correct solution for problem 1 for actual data" do
      Year2015::Day1::Solver.new.run_1.should eq 232
    end
  end

  describe "#run_2" do
    it "Gives the correct solution for problem 2 for example data" do
      parameters = [
        {")", 1},
        {"()())", 5},
      ]

      parameters.map { |(input, output)|
        solver = Year2015::Day1::Solver.new(input)
        solver.run_2.should eq output
      }
    end

    it "Gives the correct solution for problem 2 for my dataset" do
      Year2015::Day1::Solver.new.run_2.should eq 1783
    end
  end
end
