require "../common"

module Year2016::Day1
  enum Directions
    Left
    Right
  end

  enum Facing
    North
    South
    East
    West
  end

  class Position
    getter x, y

    def initialize(@x : Int32, @y : Int32)
    end

    def up(steps : Int32)
      @y += steps
    end

    def down(steps : Int32)
      @y -= steps
    end

    def left(steps : Int32)
      @x -= steps
    end

    def right(steps : Int32)
      @x += steps
    end

    def distance
      @x.abs + @y.abs
    end
  end

  class Trail
    @data : Array(Tuple(Int32, Int32))

    def initialize
      @data = [] of Tuple(Int32, Int32)
    end

    def in_chunks
      output = [] of Array(Tuple(Int32, Int32))
      @data.each_cons(2) do |i|
        output << i
      end

      output
    end

    def self.spread(endpoints : Array(Tuple(Int32, Int32)))
      result = [] of Tuple(Int32, Int32)
      return result if endpoints.size != 2

      a, b = endpoints

      a[0].to(b[0]) { |x|
        a[1].to(b[1]) { |y|
          unless {x, y} == a
            result << {x, y}
          end
        }
      }

      result
    end

    def spread
      in_chunks.flat_map { |i| Trail.spread(i) }
    end

    def revisit
      visits = Set(Tuple(Int32, Int32)).new
      spread.each { |i|
        return i if visits.includes?(i)
        visits.add(i)
      }
    end

    def <<(waypoint : Tuple(Int32, Int32))
      @data << waypoint
    end
  end

  class Movement
    @face : Facing
    @position : Position
    @trail : Trail

    getter position
    getter trail

    def initialize
      @face = Facing::North
      @position = Position.new(0, 0)
      @trail = Trail.new
    end

    def next_position(command : Tuple(Directions, Int32))
      direction, steps = command

      case direction
      in Directions::Right
        take_steps_right(steps)
      in Directions::Left
        take_steps_left(steps)
      end

      @trail << {@position.x, @position.y}
    end

    def take_steps_right(steps : Int32)
      case @face
      in Facing::North
        @position.right steps
        @face = Facing::East
      in Facing::South
        @position.left steps
        @face = Facing::West
      in Facing::East
        @position.down steps
        @face = Facing::South
      in Facing::West
        @position.up steps
        @face = Facing::North
      end
    end

    def take_steps_left(steps : Int32)
      case @face
      in Facing::North
        @position.left steps
        @face = Facing::West
      in Facing::South
        @position.right steps
        @face = Facing::East
      in Facing::East
        @position.up steps
        @face = Facing::North
      in Facing::West
        @position.down steps
        @face = Facing::South
      end
    end

    def move_all(commands : Array(Tuple(Directions, Int32)))
      commands.each { |i| next_position(i) }
    end
  end

  class Solver < Common::AbstractSolver
    YEAR = 2016
    DAY  =    1

    @data : Array(Tuple(Directions, Int32))

    def initialize
      @data = process(Common::Helper.read(YEAR, DAY))
    end

    def initialize(input : String)
      @data = process(input)
    end

    def process(input : String)
      input.split(",").map { |i| parse(i) }
    end

    def parse(command : String) : Tuple(Directions, Int32)
      command = command.strip
      direction = command[0] == 'R' ? Directions::Right : Directions::Left
      {direction, command[1..].to_i}
    end

    def run_1
      movement = Movement.new
      movement.move_all(@data)
      movement.position.distance
    end

    def run_2
      movement = Movement.new
      movement.move_all(@data)
      revisit = movement.trail.revisit
      if revisit
        x, y = revisit
        Position.new(x, y).distance
      end
    end
  end
end
