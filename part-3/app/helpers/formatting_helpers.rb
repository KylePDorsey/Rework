helpers do
  def date_formatter(date, style = 'html')
    if style == 'html'
      formatted_date = date.to_s[0..-5].gsub(' ', 'T')
    elsif style == 'human'
      formatted_date = date.strftime("%m/%d/%y at %H:%M:%S")
    end
    formatted_date
  end
end