require "../helper"

module Year2015
  class Day1
    YEAR = 2015
    DAY  =    1

    @data : Array(String)

    def initialize
      @data = Helper::Input.read(YEAR, DAY).split("")
    end

    def run_1
      @data.reduce(0) { |acc, i| i == "(" ? acc + 1 : acc - 1 }
    end

    def run_2
      floor, idx = 0, 0

      while floor != -1
        floor = @data[idx] == "(" ? floor + 1 : floor - 1
        idx += 1
      end

      idx
    end
  end
end
