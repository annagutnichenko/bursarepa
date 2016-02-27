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

  def team_hash
    @team
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



# def on_task
#  :junior do | dev, task |
# puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
# end

# def on_task
#  :senior do | dev, task |
#  puts "#{dev.name} сделает #{task}, но просит больше с такими глупостями не приставать"
#  end

end


team = Team.new do
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
end

pp team.team_hash





