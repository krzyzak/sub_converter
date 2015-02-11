class MovieTimeTest < MiniTest::Test
  def setup
    @time = SubConverter::MovieTime.new("22,534")
  end

  def test_returns_seconds
    assert_equal "22", @time.seconds
  end

  def test_returns_miliseconds
    assert_equal "534", @time.miliseconds
  end

  def test_returns_seconds_with_miliseconds
    assert_equal "22,534", @time.seconds_with_miliseconds
  end

  def test_calculates_hours
    @time.raw = "3832,207"

    assert_equal "01", @time.hours
  end

  def test_calculates_minutes
    @time.raw = "3832,207"

    assert_equal "03", @time.minutes
  end

  def test_calculates_seconds
    @time.raw = "3832,207"

    assert_equal "52", @time.seconds
  end
end
