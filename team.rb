require 'pry'
require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team
  attr_reader :seniors
  attr_reader :developers
  attr_reader :juniors

  def initialize (&block)
    @team = {}
    instance_eval &block
    @seniors = @team[:seniors]
    @developers = @team[:developers]
    @juniors = @team[:juniors]

  end

  def on_task(type, &block)
    instance_eval &block
    on_task.call
  end

  def add_task(task)
    dev.add_task(task)
    block.call(dev, task)
  end

  def have_seniors(*names)
    @team[:seniors] = names.map { |name| SeniorDeveloper.new(name) }
  end

  def have_developers(*names)
    @team[:developers] = names.map {|name| Developer.new(name)}
  end

 def have_juniors(*names)
   @team[:juniors] = names.map {|name| JuniorDeveloper.new(name)}
  end

  #def priority
   # @team.sort_by
  #end

    def all
      @team.values.flatten
    end

end


team = Team.new do
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
  on_task(:junior){
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  }
end


p team.on_task



