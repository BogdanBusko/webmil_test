require "minitest/autorun"

class Rtest < Minitest::Test
  def setup
    @before = rand_str
    @after = rand_str
    @str = rand_str
  end

  def rand_str
    ('a'..'z').to_a.shuffle[0,8].join
  end

  def test_basic_params
    assert_equal @str, format(@str)
  end

  def test_before_params
    assert_equal "#{@before}-#{@str}", format(@str, before: @before)
  end

  def test_after_params
    assert_equal "#{@str}-#{@after}", format(@str, after: @after)
  end

  def test_before_and_after_params
    assert_equal "#{@before}-#{@str}-#{@after}", format(@str, before: @before, after: @after)
  end

  def test_reverse_basic_params
    assert_equal @str.reverse, format(@str, reverse: true)
  end

  def test_reverse_before_params
    assert_equal "#{@before}-#{@str}".reverse, format(@str, before: @before, reverse: true)
  end

  def test_reverse_after_params
    assert_equal "#{@str}-#{@after}".reverse, format(@str, after: @after, reverse: true)
  end

  def test_reverse_before_and_after_params
    assert_equal "#{@before}-#{@str}-#{@after}".reverse, format(@str, before: @before, after: @after, reverse: true)
  end

  def test_wrong_param_exception
    assert_raises(ArgumentError) { format(@str, wrong_arg: 'test') }
  end
end

def format(str, params = {})
  default = { 
    before: '', 
    after: '', 
    reverse: false
  }

  raise ArgumentError if !params.keys.all?{|value| default.key? value}

  default = default.merge(params)

  before = default[:before].empty? ? '' : "#{default[:before]}-"
  after = default[:after].empty? ? '' : "-#{default[:after]}"

  result = before + str + after

  default[:reverse] ? result.reverse : result
end