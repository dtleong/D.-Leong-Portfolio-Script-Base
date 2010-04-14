class RunnerController < ApplicationController
  # The index method finds all .rb files found in db/test_files/suites/
  # Then, the view will display each file as a link.
  def index
    # Get path to dir containing the top-level program
    session[:working_dir] = File.expand_path(File.dirname($0))
    # From there, find the suite dir
    suite_dir = File.join(session[:working_dir] + "/../db/test_files/suites")
    # Store the suite dir in the session so that it can be used by other actions
    session[:suite_dir] = suite_dir
    # Get all files found at suites/*.rb
    @suites = Dir[suite_dir + "/*.rb"]
  end

  # Executes a suite and displays console output as it runs.
  def runsuite
    # get the name of the suite file chosen by the user
    @suite = params['suite']
    start_time = Time.now.strftime('%Y-%m-%d_-_%H-%M-%S')
    # Create filename for console output log
    session[:console_filename] = "log/runner/console-#{start_time}.log"
    # Create batch file that will be used to execute the test
    batch_filename = "run-#{start_time}.bat"
    wd = session[:working_dir]
    batch_path = File.join(wd + '/../runner_batch_files/' + batch_filename)
    batch_handle = File.new(batch_path, 'w+')
    # Build the command line string to execute the requested script.
    #
    # "-Cdirectory" is used to make the cmd shell cd into suite_dir before
    # executing the script, in case the suite script tries to 'require' any
    # other files. Without this, ruby might have trouble resolving the path
    # to files the suite tries to load.
    cmd = "ruby -C#{session[:suite_dir] } #{@suite} --" +
	  " -v verbose > #{session[:console_filename]}"
    batch_handle.puts cmd # write cmd to batch file
    batch_handle.close
    # Run the batch file (which launches the test suite).
    system(batch_path)
  end

  # Displays console log using periodically_call_remote
  def viewconsole
    wd = session[:working_dir]
    log_path = File.join(wd + "/../#{session[:console_filename]}")
    @console_log = File.open(log_path) { |f| f.readlines }
    render :layout => false # don't render full layout for this page
  end
end
