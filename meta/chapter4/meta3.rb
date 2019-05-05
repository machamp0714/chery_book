class HighLine
  def ask(text, lambda)
    puts text
    console = gets.chomp
    lambda.call(console)
  end
end

h1 = HighLine.new
# friends = h1.ask("友達を入力して下さい", ->(s){ s.split(',') }) 
# puts "友達一覧: #{friends.inspect}"
name = h1.ask("名前は？", -> s { s.capitalize })
puts "名前: #{name}"