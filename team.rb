class Team
  attr_reader :seniors

  def initialize (&block)
    instance_eval &block
  end

  def have_seniors (*names)
    @seniors = names
  end
end

team = Team.new do
  have_seniors "Олег", "Оксана"
  #have_developers "Олеся", "Василий", "Игорь-Богдан"
  #have_juniors "Владислава", "Аркадий", "Рамеш"
end

p team.seniors