require 'pry'
require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team
  attr_reader :seniors
  attr_reader :developers
  attr_reader :juniors
  attr_reader :team
  attr_reader :mes_juns


  def initialize (&block)
    @team = {}
    @messages = {}
    instance_eval &block
    @seniors = @team[:seniors]
    @developers = @team[:developers]
    @juniors = @team[:juniors]
  end

  #def on_task (type, &block)
    #@messages[type] = block[type]
   # puts @messages[type]
  #end

  def priority(*pr)
    @priority = pr
    sorted_team = @team.select{|x| x.can_add_task?}.sort_by{|x| [@priority.index(x.type), x.task_list.count]}
    p sorted_team
  end

# def on_task(dev)
#   case dev
#     when :junior
#       puts "разработчику  следите за ним!"
#     when :senior
#       puts "но просит больше с такими глупостями не приставать"
#     when :developer
#       puts "dev"
#   end
# end

  def have_seniors(*names)
    @team[:seniors] = names.map { |name| SeniorDeveloper.new(name) }
  end

  def have_developers(*names)
    @team[:developers] = names.map { |name| Developer.new(name) }
  end

  def have_juniors(*names)
    @team[:juniors] = names.map { |name| JuniorDeveloper.new(name) }
  end

  def seniors
    @seniors
  end

  def juniors
    @juniors
  end

  def developers
    @developers
  end

  def all
    @team.values.flatten
  end

end

team = Team.new do
  have_seniors("Олег", "Оксана")
  have_developers("Олеся", "Василий", "Игорь-Богдан")
  have_juniors("Владислава", "Аркадий", "Рамеш")
#  on_task(:junior => "Отдали задачу джуну, следите за ним!", :developer => "Отдали задачу деву, следите за ним!", :senior => "Отдали задачу синиору, следите за ним!")
  priority(:juniors, :developers, :seniors)
end

#team.on_task(:senior)
team.priority








