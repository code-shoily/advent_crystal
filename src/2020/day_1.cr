require "../common"

module Year2020::Day1
  class Solver < Common::AbstractSolver
    YEAR = 2020
    DAY  =    1

    @data : Array(Int32)

    def initialize
      @data = process(Common::Helper.read(YEAR, DAY))
    end

    def initialize(input : String)
      @data = process(input)
    end

    def process(input : String)
      input.split("\n").map { |i| i.to_i }
    end

    def run_1
      set = Set.new(@data)

      0.to(@data.size) do |idx|
        other = 2020 - @data[idx]
        return other * @data[idx] if set.includes?(other)
      end
    end

    def run_2
      set = Set.new(@data)
      @data
      0.to(@data.size - 1) do |idx|
        should_total_to = 2020 - @data[idx]

        0.to(@data.size - 1) do |jdx|
          unless jdx == idx
            other = should_total_to - @data[jdx]
            return other * @data[idx] * @data[jdx] if set.includes?(other)
          end
        end
      end
    end
  end
end
