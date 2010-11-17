require 'test/unit'
require 'fileutils'



class LoveMe_Tests < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_when_interpreting_a_simple_do_nothing_class
    example_directory = "tests/Simple Example"
    
    compiled_executable_output = ""
    
    Dir.chdir(example_directory) do      
      compiled_executable_output = `ruby "../../lib/loveme.rb"`
      puts "Simple output: " + compiled_executable_output
    end
      
    assert compiled_executable_output.include?("test execution of exe successful!!"), "the compiled executable should be executed."
    assert File.exist?(File.join(example_directory, 'bin/foo.exe')), "an executable should have been generated."
        
    # clean up
    FileUtils.rm_rf File.join(example_directory, 'bin')
  end
  
  def test_when_running_a_script_that_has_already_been_compiled_and_hasnt_changed_since_the_last_compilation
    example_directory = "tests/Caching Example"
    last_time_script_was_compiled = File.mtime(File.join(example_directory, "bin/foo.exe"))
    
    compiled_executable_output = ""
    
    Dir.chdir(example_directory) do      
      compiled_executable_output = `ruby "../../lib/loveme.rb"`
      puts "Cached compilation: " + compiled_executable_output
    end
    
    new_script_compilation_time = File.new(File.join(example_directory, "bin/foo.exe")).mtime
    
    assert_equal new_script_compilation_time, last_time_script_was_compiled, "script should not have been recompiled."
    assert compiled_executable_output.include?("test execution of exe successful!!"), "the compiled executable should be executed."    
  end
end
