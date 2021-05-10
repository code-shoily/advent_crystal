require "../common"

module Year2019::Day1
  class Rocket
    @modules = [] of Int32

    def initialize(modules : Array(Int32))
      @modules = modules
    end

    def self.fuel_1(mass : Int32)
      fuel = mass // 3 - 2
      return fuel > 0 ? fuel : 0
    end

    def self.fuel_2(mass : Int32)
      fuel = Rocket.fuel_1(mass)
      total_fuel = fuel

      while fuel > 0
        fuel = Rocket.fuel_1(fuel)
        total_fuel += fuel
      end

      total_fuel
    end

    def total_fuel_1
      @modules.map { |mod| Rocket.fuel_1(mod) }.sum
    end

    def total_fuel_2
      @modules.map { |mod| Rocket.fuel_2(mod) }.sum
    end
  end

  class Solver < Common::AbstractSolver
    YEAR = 2019
    DAY  =    1

    @data = [] of Int32

    def initialize
      process(Common::Helper.read(YEAR, DAY))
    end

    def process(input : String)
      input.each_line { |line| @data << line.to_i }
    end

    def run_1
      Rocket.new(@data).total_fuel_1
    end

    def run_2
      Rocket.new(@data).total_fuel_2
    end
  end
end
