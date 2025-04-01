tasks = []

puts "タスクを入力してください。\n終了したいときは「end」を入力してください。"

loop do
  input = gets.chomp
  if input == "end"
    break
  end
  tasks.push(input)
end

tasks.each_with_index do |task, i|
  puts "#{i + 1}: #{task}"
end