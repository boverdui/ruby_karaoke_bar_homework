class Bar

  attr_reader :name, :entry_fee, :rooms, :drinks, :till, :tabs

  def initialize(name, entry_fee, rooms, drinks, till, tabs)
    @name = name
    @entry_fee = entry_fee
    @rooms = rooms
    @drinks = drinks
    @till = till
    @tabs = tabs
  end

  def allow_entry()
    @till += 10.00
  end

  def open_tab(guest)
    @tabs << {guest: guest, drinks: []}
  end

  # def add_to_tab(guest, drink)
  #   for tab in tabs
  #     tab[:drinks] << drink if tab[:guest] == guest
  #   end
  # end

  def add_to_tab(guest, drink)
    tab = @tabs.find {|x| x[:guest] == guest}
    tab[:drinks] << drink
  end

  # def tab_total(guest)
  #   tab_total = 0.00
  #   for tab in @tabs
  #     if tab[:guest] == guest
  #       for drink in tab[:drinks]
  #         tab_total += drink.price()
  #       end
  #     end
  #   end
  #   return tab_total
  # end

  def tab_total(guest)
    tab = @tabs.find {|x| x[:guest] == guest}
    tab_total = tab[:drinks].sum {|x| x.price()}
    return tab_total
  end

  def get_payment(payment)
    @till += payment
  end

  # def close_tab(guest)
  #   for tab in @tabs
  #     @tabs.delete(tab) if tab[:guest] == guest
  #   end
  # end

  def close_tab(guest)
    @tabs.delete_if {|tab| tab[:guest] == guest}
  end

end
