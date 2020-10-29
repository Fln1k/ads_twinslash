every :day, :at => "0:00 am" do
  rake "updater:publish"
end

every :day, :at => "11:50 pm" do
  rake "updater:archive"
end
