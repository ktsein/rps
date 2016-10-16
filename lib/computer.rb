class Computer

attr_reader :computer_item

def initialize
  @computer_item
end


def random_select
  @computer_item = ["Rock", "Paper", "Scissor"].sample
end

end
