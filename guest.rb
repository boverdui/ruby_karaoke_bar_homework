class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def sufficient_funds?(item)
    @wallet >= item
  end

  def pay_entry(bar)
    fee = bar.entry_fee()
    @wallet -= fee if sufficient_funds?(fee)
  end

  def fav_on_playlist(room)
    room.playlist.include?(@favourite_song) ? "WHOO!!!" : "Bugger..."
  end

  def pay_tab(bar)
    @tab = bar.tab_total(self)
    @wallet -= @tab if sufficient_funds?(@tab)
  end

end
