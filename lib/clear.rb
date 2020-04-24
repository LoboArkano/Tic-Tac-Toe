# I found this piece of code to clean the screen.
# I modified it to handle errors
module Screen
  def self.clear
    print "\e[2J\e[f"
    raise ''
  rescue RuntimeError
    puts ''
  end
end
