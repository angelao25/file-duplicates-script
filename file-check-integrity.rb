require 'fileutils'
require 'digest' # For MD5 hashing

# Create a hash to store file paths with their MD5 sums
hash_map = {}

# Get all image files in the current directory
# Using commong image extensions - you could edit this to add more if needed

image_files = Dir.glob("*.{jpg,jpeg,png,avif}")

puts "Scanning #{image_files.length} image files..."

# Calcualte MD5 for each file and store in hash_map

image_files.each do |file|
  begin
    # Read the file content and calculate MD5
    md5 = Digest::MD5.file(file).hexdigest

    # If this hash already exists, add to array; otherwise create new array
    if hash_map[md5]
      hash_map[md5] << file
    else
      hash_map[md5] = [file]
    end
  rescue  Errno::ENOENT, Errno::EACCES => e
    puts "Error processing #{file}: #{e.message}"
  end
end

# Filter out unique files and keep only duplicates
duplicates = hash_map.select { |_, files| files.length > 1 }

# Print report
if duplicates.empty?
  puts "No duplicate images found."
else
  puts "\nDuplicate images found:"
  puts "========================"

  duplicates.each do |md5, files|
    puts "\nMD5 Hash: #{md5}"
    files.each_with_index do |file, index|
      puts "#{index + 1}. #{file}"
    end
    puts "---"
  end

  puts "\nTotal sets of duplicates: #{duplicates.length}"
  puts "Total duplicate files: #{duplicates.values.flatten.length}"
end


