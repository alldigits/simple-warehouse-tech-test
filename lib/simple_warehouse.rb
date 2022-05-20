class SimpleWarehouse
  def initialize(x: 0, y: 0, size: 0, grid: [])
    @row = row
    @col = col
    @size = size
    @grid = grid
  end

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      command = gets.chomp
      case command
        when 'help'
          show_help_message
        when 'exit'
          exit
        else
          show_unrecognized_message
      end
    end
  end

  def init(x = 10, y = 10)
    @row = x
    @col = y
    @size = x*y
    to_numbers_array
    to_empty_array
    to_grid
  end

  def view
    true
  end
  

  private

  attr_reader :row, :col, :grid

  def show_help_message
    puts <<~HELP
      help             Shows this help message
      init W H         (Re)Initialises the application as an empty W x H warehouse.
      store X Y W H P  Stores a crate of product code P and of size W x H at position (X,Y).
      locate P         Show a list of all locations occupied by product code P.
      remove X Y       Remove the entire crate occupying the location (X,Y).
      view             Output a visual representation of the current state of the grid.
      exit             Exits the application.
    HELP
  end

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def exit
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end

  def to_numbers_array
    @to_numbers_array = (1..@size).map {|i| i}
  end

  def to_empty_array
    @to_empty_array = @to_numbers_array.map {|i| i = ' '}
  end

  def to_grid
    @grid = @to_empty_array.each_slice(col).to_a
    @grid.transpose
  end

end