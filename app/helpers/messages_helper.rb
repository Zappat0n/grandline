module MessagesHelper
  def time_to_display(time)
    if time.today?
      return time.strftime("%H:%M")
    else
      return time.strftime("%Y-%m-%d %H:%M")
    end
  end
end
