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

  def on_task (type, &block)
    @messages[type] = block
  end

  def add_task(task)
      sorted_team = @team.values.flatten.select{|x| x.can_add_task?}.sort_by{|x| [@priority.index(x.type), x.tasks.count]}
     p sorted_team
    @messages[:team].call('первый аргумент', 'второй')
  end

  def priority(*pr)
   @priority = pr
  end

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
  priority(:juniors, :developers, :seniors)
  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} джуниору #{dev}, следите за ним!"
  end
  on_task :developer do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev}, следите за ним!"
  end
  on_task :senior do |dev, task|
    puts "#{dev} сделает #{task}, но просит больше с такими глупостями не приставать"
  end

end

# team.on_task(:senior)
team.add_task('fd')








