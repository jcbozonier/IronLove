files = Dir.glob("*.cs")
compiler_args = ""

if(File.exist? "bin/foo.exe")
  last_time_i_compiled = File.mtime("bin/foo.exe")
  i_prefer_to_compile = false
  
  files.each do |file|
    i_prefer_to_compile |= last_time_i_compiled < File.mtime(file)
  end
else
  i_prefer_to_compile = true
end

files.each do |file|
  compiler_args += file + ' '
end

Dir.mkdir "bin" unless File.directory? "bin"

system "csc /out:\"bin/foo.exe\" #{compiler_args}" if i_prefer_to_compile

system "bin/foo.exe"