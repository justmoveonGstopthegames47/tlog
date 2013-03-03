class Tlog::Command::Active < Tlog::Command

	def name 
		"active"
	end 

	def execute(input, output)
		output.line("execute on active command") #change to out
		#create_task(input.args[0])
		#if input.args[0].nil? raise Tlog::Error::CommandInvalid, "Invalid command input"
		print_time_entry(output)
		#if input.args[0].nil?
			# no task name given
			#@storage.create_current
		#	create_task()
		#elsif input.args[1].nil?
		#	arg1 = input.args.shift
			# task name given
			#@storage.create_current(arg1)
		#	create_task(arg1)
		#else
		#	arg1 = input.args.shift
		#	arg2 = input.args.shift
			# invalid, can't have 2 
		#end
	end

	def options(parser, options)
		parser.banner = "usage: tlog active"
	end

	private

	def print_time_entry(output)
		# should this be done in disk?
		active_tasks = @storage.all_task_dirs
		task_active = false
		out_string = ""
		active_tasks.each do |task|
			task_name = task.basename.to_s
			task_name << "(active)" if @storage.current_task_name == task_name
			out_string << task_name + "\n"
			task_active = true
		end
		out_string.prepend("No time logs active. Existing time logs:" + "\n") if task_active
		output.line(out_string)
	end

end