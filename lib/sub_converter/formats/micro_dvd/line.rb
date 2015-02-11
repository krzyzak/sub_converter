module SubConverter
  module Formats
    class MicroDVD
      class Line
        include SubtitleLine
        include Convertable

        def text
          @text || raw[:text]
        end

        def raw_start
          @raw_start || (raw[:start].to_i / fps).round(3).to_s
        end

        def raw_stop
          @raw_stop || (raw[:stop].to_i / fps).round(3).to_s
        end

        def to_s
          "{#{start.to_frame(fps)}}{#{stop.to_frame(fps)}}#{text}"
        end

        private
        def raw
          @raw ||= begin
            _, start, stop, text = line.match(/\{(\d+)\}\{(\d+)}(.*)/m).to_a

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
