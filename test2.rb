require "minitest/autorun"

class Rtest < Minitest::Test
  def test_empty
    assert_equal "", do_magic("")
  end

  def test_one_letter
    assert_equal "A", do_magic("a")
  end

  def test_two_letters
    assert_equal "Aa-B", do_magic("ab")
  end

  def test_capital_letters
    assert_equal "Tttt-Eee-Ss-T", do_magic("teSt")
  end

  def test_long_string
    assert_equal "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa-Bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb-Ccccccccccccccccccccccccccccccccccccccccc-Dddddddddddddddddddddddddddddddddddddddd-Eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee-Ffffffffffffffffffffffffffffffffffffff-Ggggggggggggggggggggggggggggggggggggg-Hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh-Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii-Jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj-Kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk-Llllllllllllllllllllllllllllllll-Mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm-Oooooooooooooooooooooooooooooo-Fffffffffffffffffffffffffffff-Dddddddddddddddddddddddddddd-Fffffffffffffffffffffffffff-Dddddddddddddddddddddddddd-Lllllllllllllllllllllllll-Ffffffffffffffffffffffff-Sssssssssssssssssssssss-Llllllllllllllllllllll-Ddddddddddddddddddddd-Ffffffffffffffffffff-Sssssssssssssssssss-Pppppppppppppppppp-Rrrrrrrrrrrrrrrrr-Oooooooooooooooo-Wwwwwwwwwwwwwww-Eeeeeeeeeeeeee-Ooooooooooooo-Rrrrrrrrrrrr-Ooooooooooo-Wwwwwwwwww-Eeeeeeeee-Rrrrrrrr-Wwwwwww-Eeeeee-Ooooo-Rrrr-Www-Ee-R", do_magic("abcdefghijklmofdfdlfsldfsproweorowerweorwer")
  end
end

def do_magic(str)
  str.split('').map.with_index{ |x, index| (x * (str.length - index)).downcase.capitalize } * '-'
end
