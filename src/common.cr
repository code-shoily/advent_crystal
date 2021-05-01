module Common
  class Helper
    def self.read(year : Int, day : Int)
      File.read("./inputs/#{year}/#{day}.txt")
    end
  end

  abstract class Solver
    abstract def read
    abstract def solve_1
    abstract def solve_2
  end
end
