
class AddToDb

  def initialize
  end

  def write(path_json_file, townhalls_hash)
    File.open(path_json_file,"w") do |f|
      f.write((townhalls_hash).to_json)
    end
  end

  def read(path_json_file)
    townhall_scrapper_json = File.read(path_json_file)
    townhalls = JSON.parse(townhall_scrapper_json)
    return townhalls
  end

  def write_handles(path_json_original, path_json_new, array_handles)
    townhalls = read(path_json_original)
    i = 0
    townhalls.each do |department, hash_department|
      hash_department.each do |townhall_name, townhall_detail|
        townhall_detail << array_handles[i]
        i += 1
      end
    end
    puts townhalls
    write(path_json_new, townhalls)

  end


end
