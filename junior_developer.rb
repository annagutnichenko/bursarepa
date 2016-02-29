require_relative "developer.rb"

class JuniorDeveloper < Developer

  MAX_TASKS = 5
  TYPE = 'junior'

  def type
    self.class::TYPE
  end

  def max_tasks
    self.class::MAX_TASKS
  end

  def add_task(task)
    @task = task
    @tasks_number += 1
    puts "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@tasks_number}"
    @tasks_list << @task
    raise "Слишком много работы!" if @tasks_number >= MAX_TASKS
  end

  def task_length(task)
    raise "Слишком сложно!" if task.length > 20
  end

  def work!
    raise "Нечего делать!" unless @tasks_number != 0
    @tasks_number = @tasks_number - 1
    puts "#{@name}: пытаюсь делать задачу \"#{@tasks_list[0]}\". Осталось задач: #{@tasks_number}"
    @tasks_list.shift
  end

end

