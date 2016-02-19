require_relative "developer.rb"

class SeniorDeveloper < Developer
  MAX_TASKS = 15

  def work!
    raise "Нечего делать!" unless @tasks_number != 0
    r = Random.rand(2)
    if r == 0
      then p "Что-то лень"
    else
      @tasks_number = @tasks_number - 2
      puts "#{@name}: выполняю параллельно две задачи: \"#{@tasks_list[0]}\" и \"#{@tasks_list[1]}\". Осталось задач: #{@tasks_number}"
      2.times {@tasks_list.shift}
    end
  end
end

#dev3 = SeniorDeveloper.new('Аня')
#dev3.add_task('first')
#dev3.add_task('second')
#dev3.add_task('third')
#dev3.work!
#dev3.tasks
