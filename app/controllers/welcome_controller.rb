class WelcomeController < ApplicationController

  # NOT CURRENT IN USE
  def export_csv
    @alerts = Alert.all
    @seconds = Second.all
    @thirds = Third.all
    
    @csv = CsvShaper.encode do |csv|
      csv.headers :title, :level, :updated_at

      csv.rows @alerts do |csv, obj|
        csv.cells :title, :level,  :updated_at
      end
      
      csv.rows @seconds do |csv, obj|
        csv.cells :title, :level,  :updated_at
      end

      csv.rows @thirds do |csv, obj|
        csv.cells :title, :level, :updated_at
      end
    end

    respond_to do |format|
       format.html
       format.csv { send_data @csv }
     end
  end

end
