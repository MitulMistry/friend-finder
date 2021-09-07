module MessagesHelper
  def readable_datetime(date_time)
    date_time.strftime("%A, %b %d, %Y, %l:%M %p")
  end
end
