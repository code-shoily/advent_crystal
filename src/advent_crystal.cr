require "./2015/*"
require "./2016/*"

module AdventCrystal
  VERSION = "0.1.0"

  macro solver(year, day)
    Year{{year}}::Day{{day}}::Solver.new()
  end

  puts solver(2016, 1).run_2.inspect
end
