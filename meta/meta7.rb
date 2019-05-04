require 'pry'

pry = Pry.new
# pry.memory_size = 101
# p pry.memory_size
# p Pry.memory_size

pry.refresh(memory_size: 99, quiet: false)
p pry.memory_size
p pry.quiet

def refresh(options = {})
  defaults[:memory_size] = Pry.memory_size
  self.memory_size = options[:memory_size] if options[:memory_size]
  defaults[:quiet] = Pry.quiet
  self.quiet = options[:quiet] if options[:quiet]
end

def refresh(options = {})
  defaults = {}
  attributes = [
    :input, :output, :commands, :print, :quiet,
    :exception_handler, :hooks, :custom_completions,
    :prompt, :memory_size, :extra_sticky_locals 
  ]
  attributes.each do |attribute|
    defaults[attribute] = Pry.send attribute
  end

  defaults.merge!(options).each do |key, value|
    send("#{key}=", value) if respond_to? ("#{key}=")
  end

  true
end