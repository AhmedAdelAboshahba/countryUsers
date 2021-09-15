class CsvUtils
  require 'csv'

  def self.read_users(file_name)
    code_to_regex_hash = {
      "237": /237 ?[2368]\d{7,8}$/,
      "251": /251 ?[1-59]\d{8}$/,
      "212": /212 ?[5-9]\d{8}$/,
      "258": /258 ?[28]\d{7,8}$/,
      "256": /256 ?\d{9}$/
    }
    code_to_country_hash = {
      "237": "Cameroon",
      "251": "Ethiopia",
      "212": "Morocoo",
      "258": "Mozambique",
      "256": "Uganda"
    }
    users = []

    CSV.foreach("#{file_name}.csv").with_index do |user_data, i|
      next if i == 0

      phone_number = user_data[2].strip
      code = phone_number[0, 3]
      if phone_number.match(code_to_regex_hash[:"#{code}"])
        users << {id: user_data[0], email: user_data[1].strip, phone_number: phone_number, country: code_to_country_hash[:"#{code}"] , parcel_weight: user_data[3].strip}
      else
        #error
      end
    end
    users
  end
end