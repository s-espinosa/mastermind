def Game
  def initialize
    @time_start = Time.new
    @time_end = nil
  end

  def time_finished
    @time_end = Time.new
  end

  def time_to_play
    @time_end - @time_start
  end
end
