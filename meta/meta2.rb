Y = 'ルートレベルの定数'
module M
  Y = 'Mにある定数'
  p ::Y
end

p M::Y
p M.constants