require "../spec_helper"

describe Year2019::Day1::Rocket do
  context "Pre-correction fuel" do
    params = [
      {2, 0},
      {12, 2},
      {14, 2},
      {1969, 654},
      {100_756, 33_583},
    ]

    describe "#fuel_1" do
      it "Calculates the correct fuel" do
        params.each_with_index do |(mass, result)|
          Year2019::Day1::Rocket.fuel_1(mass).should eq result
        end
      end
    end

    describe "#total_fuel_1" do
      it "Calculates the total fuel requirement of a rocket" do
        rocket = Year2019::Day1::Rocket.new(params.map &.[] 0)
        rocket.total_fuel_1.should eq params.map(&.[] 1).sum
      end
    end
  end

  context "Post-correction fuel" do
    params = [
      {14, 2},
      {1969, 966},
      {100_756, 50_346},
    ]

    describe "#fuel_2" do
      it "Calculates the correct fuel" do
        params.each_with_index do |(mass, result)|
          Year2019::Day1::Rocket.fuel_2(mass).should eq result
        end
      end
    end

    describe "#total_fuel_2" do
      it "Calculates the total fuel requirement of a rocket" do
        rocket = Year2019::Day1::Rocket.new(params.map &.[] 0)
        rocket.total_fuel_2.should eq params.map(&.[] 1).sum
      end
    end
  end
end

describe Year2019::Day1::Solver do
  describe "#run_1" do
    it "Gives the correct solution for problem 1 for actual data" do
      Year2019::Day1::Solver.new.run_1.should eq 3_421_505
    end
  end

  describe "#run_2" do
    it "Gives the correct solution for problem 2 for my dataset" do
      Year2019::Day1::Solver.new.run_2.should eq 5_129_386
    end
  end
end
