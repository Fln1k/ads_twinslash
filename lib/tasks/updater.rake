namespace :updater do

  task :publish => :environment do
    ads = Ad.all
    ads.each do |ad|
      if ad.can_publish?
        ad.publish
      end
    end
  end

  task :archive => :environment do
    ads = Ad.all
    ads.each do |ad|
      if ad.can_archive?
        dif = (Time.now - ad.updated_at)/60/60/24 #to days
        if dif > 2
          ad.archive
        end
      end
    end
  end

end
