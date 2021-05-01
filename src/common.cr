module Common
  class Helper
    def self.read(year : Int, day : Int)
      File.read("./inputs/#{year}/#{day}.txt")
    end
  end

  abstract class Solver
    abstract def read
    abstract def run_1
    abstract def run_2
  end
end
