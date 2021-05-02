module Common
  class Helper
    def self.read(year : Int, day : Int) : String
      File.read("./inputs/#{year}/#{day}.txt")
    end
  end

  abstract class AbstractSolver
    abstract def process(input : String)
    abstract def run_1
    abstract def run_2
  end
end
