x1 = ARGV[0]
y1 = ARGV[1]
x2 = ARGV[2]
y2 = ARGV[3]


case
  when (x1 == x2 && y1 == y2)
    puts "Точка найдена!"
  when (x1 != x2 && y1 != y2)
    puts "Близко, но нет"
  when (x1 == x2 && y1 != y2)
    puts "х координата верна, y нет"
  when (x1 != x2 && y1 == y2)
    puts "y координата верна, y нет"
end