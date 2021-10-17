File.readlines('text.txt').each_with_index do |line, i|
  if !!line.match(/\d+/)
    p line , i
  end
end