class Player

attr_reader :player_item, :name

def initialize(name)
  @name = name
  @player_item
end

def select(item)
  @player_item = item
end

end
