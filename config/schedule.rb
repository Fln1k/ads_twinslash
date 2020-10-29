every :day, :at => "0:00 am" do
  rake "pubarch:publish"
end

every :day, :at => "11:50 pm" do
  rake "pubarch:archive"
end
