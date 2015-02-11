module SubConverter
  module Convertable
    def convert_to(klass)
      klass.new.tap do |line|
        line.fps = fps
        line.raw_start = raw_start
        line.raw_stop = raw_stop
        line.text = text
        line.index = index
      end
    end
  end
end
