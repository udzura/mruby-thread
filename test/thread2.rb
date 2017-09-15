assert('Thread migrates Proc') do
  str = "mruby"
  pr = Proc.new { str }
  pr1 = Proc.new { pr.call + " with" }
  pr2 = Proc.new { pr1.call + " love" }
  a = Thread.new(pr2){|pr_| pr_.call }
  assert_equal "mruby", a.join
end

