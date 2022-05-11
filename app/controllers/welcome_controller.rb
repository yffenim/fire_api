class WelcomeController < ApplicationController
  
# formatting CSV and setting up a link to access from ios
# TODO: authentication

  def export_csv
    @alerts = Alert.all
    @seconds = Second.all
    @thirds =  Third.all

    @csv_string = CsvShaper.encode do |csv|
      csv.headers :title, :level, :updated_at

      csv.rows @alerts do |csv, alert|
        csv.cells :title, :level,  :updated_at
      end

      csv.rows @seconds do |csv, alert|
        csv.cells :title, :level,  :updated_at
      end

      csv.rows @thirds do |csv, alert|
        csv.cells :title, :level, :updated_at
      end
    end

    respond_to do |format|
       format.html
       format.csv { send_data @csv_string }
     end
  end

end
