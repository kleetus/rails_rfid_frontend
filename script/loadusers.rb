ENV['RAILS_ROOT'] = '../'
require "#{ENV['RAILS_ROOT']}/config/environment"


import_file = open('/Users/ckleeschulte/Desktop/Primrose Creek Badges.csv', 'r')
rfid_mapping = open('/Users/ckleeschulte/rfid_mapping.txt', 'r')
map = {}

rfid_mapping.each_line do |l|  
  la = l.split
  internal_card = la.shift
  map[la.join('')] = internal_card
end


import_file.each_line do |l|
  # First Name,Last Name,BadgeID,House Number,Street
  line_array = l.split(',')
  name = "#{line_array[0]} #{line_array[1]}"
  intcardid = line_array[2].gsub(/\s+|,|"/, '')
  cardid = map[intcardid]
  #if not exact card number, just find partial
  unless map.has_key? intcardid
    map.keys do |key|
      if intcardid[-7..-1] =~ key
        cardid = map[key]
        break
      end
    end
  end
  puts l if cardid.blank?
end

#puts map.keys

