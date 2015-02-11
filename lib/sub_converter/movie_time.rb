module SubConverter
  class MovieTime
    attr_accessor :raw

    def initialize(raw)
      self.raw = raw
    end

    def raw=(value)
      @raw, @miliseconds = value.split(",").map(&:to_i)
    end

    def hours
      format(output[:hours])
    end

    def minutes
      format(output[:minutes])
    end

    def seconds
      format(output[:seconds])
    end

    def miliseconds
      format(@miliseconds)
    end

    def seconds_with_miliseconds
      [seconds, miliseconds].join(",")
    end

    private
    def output
      @output ||= begin
        hours = (raw / 3600).to_i
        minutes = ((raw - (hours * 3600)) / 60).to_i
        seconds = (raw - (hours * 3600) - (minutes * 60) ).to_i
        {
          hours: hours,
          minutes: minutes,
          seconds: seconds
        }
      end
    end

    def format(value)
      sprintf("%.2d", value)
    end
  end
end
