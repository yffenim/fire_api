class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def convert_to_1_to_5
    scale = { 
      1.0 => 1.0, 
      2.0 => 1.5, 
      3.0 => 2.0,
      4.0 => 2.5,
      5.0 => 3.0,
      6.0 => 3.5,
      7.0 => 4.0,
      8.0 => 4.5,
      9.0 => 5.0
    }
    int = self.level
    float = scale[int]
    self.level = float
  end

end
