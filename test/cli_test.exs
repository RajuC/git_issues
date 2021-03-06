defmodule CliTest do
	use ExUnit.Case

	import Issues.CLI, only: [parse_args: 1]

	test ":help returned by option passing with -h and --help options" do
		assert parse_args(["-h","anything"]) == :help
		assert parse_args(["--help","anything"]) == :help
	end

	test "three values returned if three values given" do
		assert parse_args(["user","project","99"])	== 	{"user","project",99}
	end

	test "Count is default returned if two values given" do
		assert parse_args(["user","project"])	== 	{"user","project",4}
	end	
end