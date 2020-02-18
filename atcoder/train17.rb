# テトリス
class Block
  attr_reader :width, :height, :pos

  def initialize(width, height, pos)
    @width = width
    @height = height
    @pos = pos
  end

  def bottom_block(pos, height, zone, h = 0)
    row = (pos..(pos + (width - 1))).map { |w| zone[h][w] }
    return h if row.include?("#")
    return height - 1 if h == height - 1

    h += 1
    bottom_block(pos, height, zone, h)
  end

  def start_height(height, zone)
    x = pos
    bottom_block(pos, height, zone)
  end

  def occupied_zone(start_pos, zone)
    x = pos
    area = (0..(height - 1)).map do |h|
      (0..(width - 1)).map do |w|
        zone[start_pos - h][x + w]
      end
    end.flatten

    if area.all? { |pos| pos == "." }
      (0..(height - 1)).map do |h|
        (0..(width - 1)).map do |w|
          [start_pos - h, x + w]
        end
      end.flatten(1)
    else
      occupied_zone(start_pos - 1, zone)
    end
  end
end

HEIGHT, WIDTH, N = gets.chomp.split.map(&:to_i)
blocks = []
N.times do
  height, width, pos = gets.chomp.split.map(&:to_i)
  blocks << Block.new(width, height, pos)
end

init_zone = Array.new(HEIGHT).map { Array.new(WIDTH, ".") }

result = blocks.each_with_object(init_zone) do |block, zone|
  start_height = block.start_height(HEIGHT, zone)
  occupied_zone = block.occupied_zone(start_height, zone)

  occupied_zone.each { |h, w| zone[h][w] = "#" }
  zone
end

result.each { |row| puts row.join.to_s }
