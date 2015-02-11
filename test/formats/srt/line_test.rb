class SrtLineTest < MiniTest::Test
  def setup
    @line = SubConverter::Formats::Srt::Line.new(line: example_line, fps: 23.976)
  end

  def test_returns_text
    assert_equal example_text, @line.text
  end

  def test_calculates_raw_start
    assert_equal "00:00:21,600", @line.raw_start
  end

  def test_calculates_raw_end
    assert_equal "00:00:24,160", @line.raw_stop
  end

  def test_returns_start
    assert_kind_of SubConverter::MovieTime, @line.start
  end

  def test_returns_stop
    assert_kind_of SubConverter::MovieTime, @line.stop
  end

  def test_converts_to_string
    line = SubConverter::Formats::Srt::Line.new.tap do |l|
      l.fps = 23.976
      l.raw_start = "21.600"
      l.raw_stop = "24.160"
      l.text = example_text
    end
    assert_equal(example_line, line.to_s)
  end

  def example_line
    unindent(<<-LINE)
      2
      00:00:21,600 --> 00:00:24,160
      I'm a
      multi line
      string
    LINE
  end

  def example_text
    unindent(<<-TEXT)
    I'm a
    multi line
    string
    TEXT
  end

  def unindent(s)
    s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, "")
  end
end
