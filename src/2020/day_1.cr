require "../common"

module Year2020::Day1
  class Solver < Common::AbstractSolver
    YEAR = 2020
    DAY  =    1

    @data = [] of Int32
    @set : Set(Int32)

    def initialize
      process(Common::Helper.read(YEAR, DAY))
      @set = Set.new(@data)
    end

    def process(input : String)
      input.each_line { |line| @data << line.to_i }
    end

    def run_1
      0.to(@data.size) do |idx|
        remaining = 2020 - @data[idx]
        return remaining * @data[idx] if @set.includes?(remaining)
      end
    end

    def run_2
      0.to(@data.size - 1) do |idx|
        0.to(@data.size - 1) do |jdx|
          unless jdx == idx
            remaining = (2020 - @data[idx]) - @data[jdx]
            return remaining * @data[idx] * @data[jdx] if @set.includes?(remaining)
          end
        end
      end
    end
  end
end
