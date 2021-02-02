require_relative 'room'

class RoomRepository
  # State
  # - rooms array
  # - next id
  # Behavior
  # - add room
  # - load csv
  # - get all rooms

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  def all
    @rooms
  end

  def find(id)
    # Find the Room instance with `id` id
    @rooms.find { |room| room.id == id }
  end

  def add_room(room)
    room.id = @next_id
    @next_id += 1
    @rooms << room
    # store to csv
  end

  private

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      p row
      row[:id] = row[:id].to_i
      @rooms << Room.new(row)
    end
    @next_id = @rooms.last.id + 1 if @rooms.any?
  end
end
