require 'minitest/autorun'
require 'PlayersGameGem'

class VectorTest < Minitest::Test
  def test_position_equal
    pos1 = PlayersGameGem::Position.new([2, 2])
    pos2 = PlayersGameGem::Position.new([2, 2])
    assert_equal pos1, pos2
  end

  def test_position_diff
    pos1 = PlayersGameGem::Position.new([3, 3])
    pos2 = PlayersGameGem::Position.new([2, 2])
    diff pos1, pos2
  end

  def test_should_equal_normalize
    vec1 = PlayersGameGem::Position.new([100, 100]).normalize
    vec2 = PlayersGameGem::Position.new([2, 2]).normalize
    assert_equal vec1, vec2
  end

  def test_create_new_player_group
    player_group = PlayerGroup.new
    assert player_group.is_a?(PlayerGroup), 'No se pudo crear un grupo vacío'
  end

  def test_player_count_works
    player_group = PlayerGroup.new
    player_group.add_new_player
    player_group.add_new_player
    player_group.add_new_player
    assert player_group.count==3, 'Numero incorrecto de grupos'
  end

  def test_player_level_1_from_start
    player = Player.new
    assert player.level==1, 'Deberia ser inicializado con nivel 1'
  end

  def test_player_has_life
    player = Player.new
    assert player.life>=1, 'Deberia tener vida'
  end

  def test_player_kill_another
    p1 = Player.new
    p2 = Player.new
    while p2.is_alive?
      p1.try_to_attack(p2)
    end

    assert (not p2.is_alive?), "Como que esta vivo ¿? WTF se re murio"
  end
end