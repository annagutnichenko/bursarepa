require 'pry'
require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team

  attr_reader :seniors, :developers, :juniors

  def initialize(&block)
    instance_eval &block
  end

  def have_developers(*names)
    @developers = names.map { |name| Developer.new(name) }
    @dnames = [names]
  end

  def have_seniors(*names)
    @seniors = names.map { |name| SeniorDeveloper.new(name) }
    @snames = [names]
  end

  def have_juniors(*names)
    @juniors = names.map { |name| JuniorDeveloper.new(name) }
    @jnames = [names]
  end

end
p team.seniors
team = Team.new do
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
end

