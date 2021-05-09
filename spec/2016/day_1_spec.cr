require "../spec_helper"

describe Year2016::Day1::Solver do
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

  describe Year2016::Day1::Trail do
    waypoints = [{0, 0}, {0, 5}, {0, 4}, {-6, 5}]

    describe "#in_chunks" do
      it "Breaks data into chunk of two" do
        trail = Year2016::Day1::Trail.new
        waypoints.each { |waypoint| trail << waypoint }
        trail.in_chunks.should eq [[{0, 0}, {0, 5}], [{0, 5}, {0, 4}], [{0, 4}, {-6, 5}]]
      end

      it "Sends empty array for empty waypoints" do
        trail = Year2016::Day1::Trail.new
        trail.in_chunks.empty?.should be_true
      end
    end

    describe "Trail.spread" do
      context "Spreads across x-axis" do
        it "Spreads in ascending direction" do
          Year2016::Day1::Trail.spread([{0, 0}, {0, 3}]).should eq [{0, 1}, {0, 2}, {0, 3}]
        end
        it "Spreads in descending direction" do
          Year2016::Day1::Trail.spread([{0, 0}, {0, -3}]).should eq [{0, -1}, {0, -2}, {0, -3}]
        end
      end
      context "Spreads across y-axis" do
        it "Spreads in ascending direction" do
          Year2016::Day1::Trail.spread([{0, 0}, {3, 0}]).should eq [{1, 0}, {2, 0}, {3, 0}]
        end
        it "Spreads in descending direction" do
          Year2016::Day1::Trail.spread([{0, 0}, {-3, 0}]).should eq [{-1, 0}, {-2, 0}, {-3, 0}]
        end
      end
      context "Does not spread" do
        it "Does not spread for empty waypoints" do
          Year2016::Day1::Trail.spread([] of Tuple(Int32, Int32)).empty?.should be_true
        end

        it "Does not spread for wrong waypoints" do
          Year2016::Day1::Trail.spread([{0, 1}, {2, 3}, {3, 4}]).empty?.should be_true
        end

        it "Does not spread for equal waypoints" do
          Year2016::Day1::Trail.spread([{0, 1}, {0, 1}]).empty?.should be_true
        end
      end
    end

    describe "#revisit" do
      trail = Year2016::Day1::Trail.new
      waypoints.each { |waypoint| trail << waypoint }
      trail.revisit.should eq ({0, 4})
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
