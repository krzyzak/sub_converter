module SubConverter
  module SubtitleLine
    attr_accessor :line, :fps, :raw_start, :raw_stop, :text, :index

    def initialize(line: nil, fps: nil, index: nil)
      @line = line.to_s
      @fps = fps
      @index = index.to_i
    end

    def start
      MovieTime.new(raw_start)
    end

    def stop
      MovieTime.new(raw_stop)
    end
  end
end
