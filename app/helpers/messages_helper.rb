module MessagesHelper
  def time_to_display(time)
    if time.today?
      time.strftime("%H:%M")
    else
      time.strftime("%Y-%m-%d %H:%M")
    end
  end
end
