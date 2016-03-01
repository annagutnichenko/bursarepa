require 'pry'
require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team
  attr_reader :seniors
  attr_reader :developers
  attr_reader :juniors
  attr_reader :team


  def initialize (&block)
    @team = {}
    @messages = {}
    @priorities = []
    instance_eval &block
    @seniors = @team[:seniors]
    @developers = @team[:developers]
    @juniors = @team[:juniors]
  end

  def priority(*pr)
    @priority = pr
  end

  def on_task (type, &block)
    @messages[type] = block if block_given?
  end

  def add_task(task)
    @priority.each do |priority|
      sorted = @team[priority].sort_by { |dev| dev.tasks_number }.first
      @sorted_all = @team[priority].sort_by { |dev| dev.tasks_number }
      if sorted.max_tasks > sorted.tasks_number
        @messages[sorted.type].call(sorted, task)
        break
      end
    end
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

  def report
    @sorted_all.each do |dev|
      puts "#{dev.name.join} (#{dev.dev_type.to_s[0...-1].to_sym}): #{dev.tasks_number.join(' ')}"
    end
  end

end

team = Team.new do
  have_seniors("Олег", "Оксана")
  have_developers("Олеся", "Василий", "Игорь-Богдан")
  have_juniors("Владислава", "Аркадий", "Рамеш")
  priority(:juniors, :developers, :seniors)
  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} джуниору #{dev.name}, следите за ним!"
  end
  on_task :developer do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end
  on_task :senior do |dev, task|
    puts "#{dev.name} сделает #{task}, но просит больше с такими глупостями не приставать"
  end

end

# team.on_task(:senior)
team.report








