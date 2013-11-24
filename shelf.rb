#so, we do have a shelf
#shelf is: shelf = {}
#shelf consist of books, book title => volume
#each pair contains books/volume
#we need to count total volume to know the shelf size
#even more, we need to add implement a page limit to the shelf
#so we need to get integer, 'total_volume'
#then we need a function to ADD another book (title and volume)
#and now we need to check against the max_volume

#check the sum

class Shelf
  def total_volume 
    contents.values.inject(0) {|total, number| total + number}
  end

  def contents
    @contents ||= {}
  end

  def list
    contents.map do |title, volume|
      "#{title}: #{volume} pages"
    end.join("\n")
  end

  def save(filename = 'tmp/savefile')
    File.open(filename, 'w') do |file|
      contents.each do |entry|
        file.puts entry.join(",")
      end
    end
  end


  def import(filename = 'tmp/savefile')
    lines = IO.readlines(filename)
    lines.each do |line|
      key, value = line.strip.split(',')
      contents[key] = value.to_i
    end


  end
end
