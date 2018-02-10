class Room

  attr_reader :name, :capacity, :playlist, :guests

  def initialize(name, capacity, playlist)
    @name = name
    @capacity = capacity
    @playlist = playlist
    @guests = []
  end

  def add_song(song)
    @playlist << song
  end

  def remove_song(song)
    @playlist.slice!(@playlist.index(song), 1)
  end

  def count_guests()
    @guests.count()
  end

  def check_in_guest(guest)
    @guests << guest if guests.count() < @capacity
  end

  def check_out_guest(guest)
    @guests.slice!(@guests.index(guest), 1)
  end

  def empty()
    @guests.clear()
  end

end
