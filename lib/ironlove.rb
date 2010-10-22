files = Dir.glob("*.cs")
compiler_args = ""

files.each do |file|
  compiler_args += file + ' '
end

puts "csc #{compiler_args}"
system "csc #{compiler_args}"