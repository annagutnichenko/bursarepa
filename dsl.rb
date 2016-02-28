require 'pry'

class Team
  attr_reader :height
  attr_reader :age
  attr_writer :age

  def initialize(height, age)
    @height = height
    @age = age
  end

  def sorted
    arr = {1=>"f",3=>"s",10=>"t", 0=>"z", 7=>"s"}
    return arr.sort_by{|x,y| x}
  end

end
team = Team.new('167', '27')


#team.height = '168'
team.age = '28'

# p team.age
# p team.height
#p team.sorted


прототипы для наших on_task и add_task
# принимает блок и имя фильтра и запоминает его
def add_filter(name, &block)
  @filters[name] = block
end
# принимает имя фильтра и аргументы фильтра
def filter(name, *arg)
  fltr = @filters[name] # находит фильтр по имени
  @books.select{|b| fltr.call(b, *arg)} # фильтрует книжки найденным фильтром, передавая ему аргументы
end