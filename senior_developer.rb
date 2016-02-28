require_relative "developer.rb"

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  var type :senior

  def add_task(task)
    @task = task
    @tasks_number += 1
    p "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@tasks_number}"
    @tasks_list << @task
    raise "Слишком много работы!" if @tasks_number >= MAX_TASKS
  end

  def work!
    raise "Нечего делать!" unless @tasks_number != 0
    r = Random.rand(2)
    if r == 0
    then
      p "Что-то лень"
    else
      @tasks_number = @tasks_number - 2
      puts "#{@name}: выполняю параллельно две задачи: \"#{@tasks_list[0]}\" и \"#{@tasks_list[1]}\". Осталось задач: #{@tasks_number}"
      2.times { @tasks_list.shift }
    end
  end
end
