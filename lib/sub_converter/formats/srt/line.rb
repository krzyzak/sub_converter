module SubConverter
  module Formats
    class Srt
      class Line
        include SubtitleLine
        include Convertable

        def text
          @text || raw[:text]
        end

        def raw_start
          @raw_start || raw[:start]
        end

        def raw_stop
          @raw_stop || raw[:stop]
        end

        def time
          [start.to_time, stop.to_time].join(" --> ")
        end

        def to_s
          [index, time, text].join("\n")
        end

        private
        def raw
          @raw ||= begin
            index, time, text= line.split("\n", 3)
            start, stop = time.split(" --> ")
            {
              start: start,
              stop: stop,
              text: text
            }
          end
        end
      end
    end
  end
end
