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
    @wallet -= bar.entry_fee if sufficient_funds?(bar.entry_fee())
  end

  def fav_on_playlist(room)
    room.playlist.include?(@favourite_song) ? "WHOO!!!" : "Bugger..."
  end

  def pay_tab(bar)
    tab_total = 0.00
    for tab in bar.tabs()
      if tab[:guest] == self
        for drink in tab[:drinks]
          tab_total += drink.price
        end
      end
    end
    @wallet -= tab_total if sufficient_funds?(tab_total)
  end

end
