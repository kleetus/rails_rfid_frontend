require 'pp'
require 'mysql'

dbh = Mysql.real_connect("kleetus-xen.dyndns.org", "kleetus", "kleetusu5uisu5utheu5ubest", "rfid")

f=open("badge.csv") 

map_file=open("rfid_mapping.txt")

map={}
map_file.each_line do |l|
  a=l.split("\t\t")
  map[a[1].gsub(/\W/, '')] = a[0]
end

# create_table "rfidusers", :force => true do |t|
#   t.string   "name"
#   t.string   "address"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "activated"
#   t.string   "cardid"
# end

a=f.read.split("\r")
a.shift
a.each do |l|
  row=l.split(',')
  name = "#{row[0]} #{row[1]}"
  cardid = row[2]
  activated = 1
  address = row[3]
  now = Time.now.strftime("%Y-%m-%d %H-%M-%S")
  cardid = cardid.gsub(/\W/, '')
  outsidecardid = map[cardid]
  #pp "#{outsidecardid} -- #{cardid}"
  dbh.query("INSERT INTO rfidusers (name,address,created_at,updated_at,activated,cardid,outsidecardid) VALUES ('#{name}','#{address}','#{now}','#{now}','#{activated}','#{cardid}', '#{outsidecardid}')")
  #puts "INSERT INTO rfid_dev (name,address,created_at,updated_at,activated,cardid,outsidecardid) VALUES ('#{name}','#{address}','#{now}','#{now}','#{activated}','#{cardid}', '#{outsidecardid}')"
end

dbh.close if dbh