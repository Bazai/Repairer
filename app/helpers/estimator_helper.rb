module EstimatorHelper
  def brand_select brands
    if (!brands[:list].empty?)
      result = collection_select :brand, :id, brands[:list], :id, :name, :options
      if condition
        
      end
    end
  end
end
