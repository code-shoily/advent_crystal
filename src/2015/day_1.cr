require "../common"

module Year2015
  class Day1 < Common::Solver
    YEAR = 2015
    DAY  =    1

    @data : Array(String)

    def initialize
      @data = read
    end

    def read
      Common::Helper.read(YEAR, DAY).split("")
    end

    def solve_1
      @data.reduce(0) { |acc, i| i == "(" ? acc + 1 : acc - 1 }
    end

    def solve_2
      floor, idx = 0, 0

      while floor != -1
        floor += @data[idx] == "(" ? 1 : -1
        idx += 1
      end

      idx
    end
  end
end
