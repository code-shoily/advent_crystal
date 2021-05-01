require "./2015/*"
module AdventCrystal
  VERSION = "0.1.0"

  macro solve(year, day, problem)
    Year{{year}}::Day{{day}}.new().run_{{problem}}()
  end

  puts solve(2015, 1, 1)
end
