module Printable
  def print
    'print'
  end

  def prepare_cover
    'prepare_cover'
  end
end

module Document
  def print_to_screen
    p prepare_cover
    p format_for_screen
    p print
  end

  def format_for_screen
    'format_for_screen'
  end

  def print
    'print###'
  end
end

class Book
  prepend Document
  include Printable
end

b = Book.new
p Book.ancestors
b.print_to_screen