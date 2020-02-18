button_count, tap_count = gets.chomp.split.map(&:to_i)
logs = []
@data = []
@count = 0

tap_count.times do
  play, log = gets.chomp.split
  logs << [play, log]
end

def continuous_data_save(play_data, log_data)
  @data << [play_data, log_data]
end

def jugde(play_data, log_data)
  play_data.gsub(/#/, "+") == log_data
end

def continuous_success?
  @data.all? { |play_data, log_data| jugde(play_data, log_data) }
end

def before_judge
  if continuous_success?
    @count
  else
    @count = 0
  end
  @data = []
end

def standard_judge(play_data, log_data)
  before_judge unless @data.empty?

  if play_data == log_data
    @count += 1
  else
    @count = 0
  end
end

combo_count = logs.each_with_object([]) do |log, array|
  play_data = log[0]
  log_data = log[1]

  if play_data.include?("#")
    continuous_data_save(play_data, log_data)
    if @data.size == 1 && jugde(play_data, log_data)
      @count += 1
    else
      @count
    end
  else
    standard_judge(play_data, log_data)
  end
  array << @count
end

p combo_count.max
p combo_count
