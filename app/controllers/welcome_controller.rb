class WelcomeController < ApplicationController
  
# formatting CSV and setting up a link to access from ios
# TODO: authentication
# CSV - do we need the title of each item as an object attribute
# or is it as a header ok?

  def export_csv

    @alerts = Alert.all[1...get_total(Alert)]
    alerts_title = Alert.first.title

    @seconds = Second.all[1...get_total(Second)]
    seconds_title = Second.first.title

    @thirds =  Third.all[1...get_total(Third)]
    thirds_title = Third.first.title

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

    # @csv_seconds = CsvShaper.encode do | csv |
    #   csv.headers seconds_title, :level, :updated_at

    #   csv.rows @seconds do |csv, obj|
    #     csv.cells :title, :level, :updated_at
    #   end
    # end

    respond_to do |format|
       format.html
       format.csv { send_data @csv }
     end
  end

end
