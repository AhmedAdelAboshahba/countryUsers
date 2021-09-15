class CsvUtils
  require 'csv'

  def self.read_users(file_name)
    code_to_regex_hash = Country.pluck(:code, :regex).to_h
    code_to_id_hash = Country.pluck(:code, :id).to_h
    code_to_count_hash = Country.pluck(:code, :users_count).to_h
    users = []

    CSV.foreach("#{file_name}.csv").with_index do |user_data, i|
      next if i == 0

      phone_number = user_data[2].strip
      code = phone_number[0, 3]
      if phone_number.match(Regexp.new(code_to_regex_hash[code]))
        users << {id: user_data[0], email: user_data[1].strip, phone_number: phone_number, country_id: code_to_id_hash[code] , parcel_weight: user_data[3].strip}
        code_to_count_hash[code] += 1
      else
        #error
      end
    end
    { users: users, code_to_count_hash: code_to_count_hash }
  end
end