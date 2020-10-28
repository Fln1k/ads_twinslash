module AdsHelper
  def get_ads_types(ads_types)
    ads_types.map { |t| [t.name, t.id] }
  end

  def get_name_of_type types, id
    types.each do |type|
      if type[:id] == id
        return type[:name]
      end
    end
  end
end
