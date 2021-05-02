require "../common"

module Year2015::Day1
  class Solver < Common::AbstractSolver
    YEAR = 2015
    DAY  =    1

    @data : Array(Char)

    def initialize
      @data = read
    end

    def read
      Common::Helper.read(YEAR, DAY).chars
    end

    def run_1
      @data.reduce(0) { |acc, i| i == '(' ? acc + 1 : acc - 1 }
    end

    def run_2
      floor, idx = 0, 0

      while floor != -1
        floor += @data[idx] == '(' ? 1 : -1
        idx += 1
      end

      idx
    end
  end
end
