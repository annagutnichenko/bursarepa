require_relative "developer.rb"

class JuniorDeveloper < Developer
  MAX_TASKS = 5

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

#dev2 = JuniorDeveloper.new('Аня')
#dev2.add_task('Попить водички')
#dev2.work!
# dev2.task_length("12345678901234567")
#dev2.work!