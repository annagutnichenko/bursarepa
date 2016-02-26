def animal_says(type, what)
  puts type          #^ знак, что тут ожидается блок
  what.call
end

# вызывается так:
bl = Proc.new {puts 'rrr' }
animal_says('tiger', bl)