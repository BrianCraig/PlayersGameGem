class LivingBeing
  attr_reader :name, :life, :alive
  @@initial_max_life = 100.0

  def initialize name: '', life: 100.0, alive: true
    @name = name
    @life = life
    @alive = alive
    @max_life = @@initial_max_life
  end

  def remove_life quantity
    @life-=quantity
    if @life<=0
      set_dead
      @life=0
    end
  end

  def set_dead
    @alive = false
  end

  def is_alive?
    @alive
  end
end

class LeveableBeing < LivingBeing
  attr_reader :level, :asd
  @@experience_needed = 100

  def initialize
    @level = 1
    @experience = 0
    super
  end

  def add_experience quantity = 0
    @experience += quantity
    check_if_new_level
  end

  def check_if_new_level
    while (can_upgrade_level)
      upgrade_level
    end
  end

  def upgrade_level
    @level+=1
    @experience -= @@experience_needed
  end

  def can_upgrade_level
    @experience >= @@experience_needed
  end
end

