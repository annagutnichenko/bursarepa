class Developer

  attr_reader :type

  def initialize(name)
    @name = name
    @tasks_number = 0
    @tasks_list = []
  end

  MAX_TASKS = 10

  def type
    @type='developer'
  end

  def max_tasks
    self.class::MAX_TASKS
  end

  def add_task(task)
    @task = task
    @tasks_number += 1
    p "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@tasks_number}"
    @tasks_list << @task
    raise "Слишком много работы!" if @tasks_number >= max_tasks
  end

  def tasks
    @tasks_list.each { |task| p task }
  end

  def work!
    raise "Нечего делать!" unless @tasks_number != 0
    @tasks_number = @tasks_number - 1
    puts "#{@name}: выполнена задача \"#{@tasks_list[0]}\". Осталось задач: #{@tasks_number}"
    @tasks_list.shift
  end

  def status
    case
      when @tasks_number == 0
        p "свободен"
      when @tasks_number < max_tasks
        p "работаю"
      when @tasks_number >= max_tasks
        p "занят"
    end
  end

  def can_add_task?
    p @tasks_number < max_tasks ? true : false
  end

  def can_work?
    p @tasks_number != 0 ? true : false
  end

end
