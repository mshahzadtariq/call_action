module CallAction
	class InstallGenerator < Rails::Generators::NamedBase
	  source_root File.expand_path("../templates", __FILE__)
	 
	  def copy_initializer_file
	    copy_file "initializer.rb", "config/initializers/call_action.rb"
	  end
	end
end		