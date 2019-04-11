# 空白文字を自由自在に操ろう
## '^' は「行頭」を表すメタ文字
## '$' は「行末」を表すメタ文字

text = <<-TEXT
def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')
          
hello('Bob')
	
hello('Carol')
TEXT

puts text.gsub(/^[ \t]+$/, '')

text = <<-TEXT
{
  japan:	'yen',
  america:'dollar',
  italy:     'euro'
}
TEXT

# puts text.gsub(/:[ \t]*/, ':  ')
puts text.gsub(/:\s*/, ': ')

