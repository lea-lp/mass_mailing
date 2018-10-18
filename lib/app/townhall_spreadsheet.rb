require 'google_drive'

class DumpSpreadsheet

attr_accessor :session, :ws

  def initialize
    @session = GoogleDrive::Session.from_config("config.json")
    @ws = session.spreadsheet_by_key("1yrCKyRpJVQIifVQqdwiWdhtuN0Gw23Z6lSimWcAwAzA").worksheets[0]
  end

  def send_to_drive(json_hash) #Parcours le .json et range le nom des villes, les n° de departement, son eamil et son handle dans une colone du google sheet.
    i = 1
    json_hash.each do |k|
      k.each do |key, value|
        if value[2] != nil
          ws[i, 4] = value[2]
        end
      end
        ws[i, 1] = key
        ws[i, 2] = value[0]
        ws[i, 3] = value[1]

        i += 1
    end
    ws.save
  end
end
