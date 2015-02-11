require "sub_converter/formats/micro_dvd/line"

module SubConverter
  module Formats
    class MicroDVD
      attr_reader :path, :fps

      def initialize(path, fps)
        @path = Pathname.new(path)
        @fps = fps
      end

      def lines
        path.each_line.map.with_index do |line, index|
          Line.new(line: line, fps: fps, index: index+1)
        end
      end
    end
  end
end
