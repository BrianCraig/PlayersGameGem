require_relative 'LivingBeign'

class PlayerGroup
  def initialize players=[]
    @players = players
  end
  def add_new_player
    new_player=Player.new
    @players.push(new_player)
    new_player
  end
  def count
    @players.count
  end
  def to_s
    "Player Group that cointains #{count} players"
  end
end

class Player < LeveableBeing
  private_instance_methods :attack

  def initialize
    super
  end

  def try_to_attack(enemy)
    attack enemy if can_attack?
  end

  def attack(enemy)
    enemy.got_attack_from(self)
    puts enemy.life
  end

  def can_attack?
    true #TODO
  end

  def got_attack_from(attacker)
    remove_life(attacker.damage)
  end

  def damage
    @level*10
  end
end