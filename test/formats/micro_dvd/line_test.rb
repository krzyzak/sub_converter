class MicroDVDLineTest < MiniTest::Test
  def setup
    @line = SubConverter::Formats::MicroDVD::Line.new(line: "{5503}{5541}I am text!", fps: 23.976)
  end

  def test_returns_text
    assert_equal "I am text!", @line.text
  end

  def test_calculates_raw_start
    assert_equal "229.521", @line.raw_start
  end

  def test_calculates_raw_end
    assert_equal "231.106", @line.raw_stop
  end

  def test_returns_start
    assert_kind_of SubConverter::MovieTime, @line.start
  end

  def test_catches_multiline_strings
    @line = SubConverter::Formats::MicroDVD::Line.new(line: "{5503}{5541}Testing \n multi
      line
      string!", fps: 23.976)

    assert_equal "Testing \n multi
      line
      string!", @line.text
  end

  def test_converts_to_string
    line = SubConverter::Formats::MicroDVD::Line.new.tap do |l|
      l.fps = 23.976
      l.raw_start = "22.034"
      l.raw_stop = "22.034"
      l.text = "this is a test"
    end

    assert_equal "{528}{528}this is a test", line.to_s
  end
end
