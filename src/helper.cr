module Helper
    class Input
        def self.read(year : Int, day : Int)
            File.read("./inputs/#{year}/#{day}.txt")
        end
    end
end