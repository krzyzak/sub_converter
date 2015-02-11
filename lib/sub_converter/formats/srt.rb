require "sub_converter/formats/srt/line"

module SubConverter
  module Formats
    class Srt
      attr_reader :path, :fps

      def initialize(path, fps)
        @path = Pathname.new(path)
        @fps = fps
      end

      def lines
        path.each_line.lazy.map do |line|
          Line.new(line, fps)
        end
      end
    end
  end
end
