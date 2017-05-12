#!/usr/bin/env ruby

class ClockWatcher
  def double_report
    return look_1 + "\n" + look_2
  end

  def look_1
    e = exact_time
    return "First time I looked, the microsecond hand was on #{e}."
  end

  def look_2
    e = exact_time
    return "The second time, it was on #{e}."
  end

  def exact_time
    t = Time.now
    return t.usec
  end
end

cw = ClockWatcher.new
puts cw.double_report
