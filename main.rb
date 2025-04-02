require "csv"

tasks = []

# ===CSVファイルを読み込み===
if File.exist?("tasks.csv")
  CSV.foreach("tasks.csv") do |row|
    tasks << row[0]
  end
  tasks.each_with_index do |task, i|
    puts "#{i + 1}: #{task}"
  end
end

# ===タスクの登録===
puts "タスクを入力してください。\n終了したいときは「end」を入力してください。"

loop do
  input = gets.chomp
  if input == "end"
    break
  end
  tasks.push(input)
end

# ===タスクの一覧表示===
tasks.each_with_index do |task, i|
  puts "#{i + 1}: #{task}"
end

# ===タスクの削除===
if tasks.empty?
  puts "削除するタスクはありません"
else
  puts "削除したいタスクの番号を選択してください。\n0を入力すると削除を終了します。"
  loop do
    input = gets.to_i
    if input < 0 || input > tasks.length
      puts "無効な番号です。"
    elsif input == 0
      break
    else
      tasks.delete_at(input - 1)
      tasks.each_with_index do |task, i|
        puts "#{i + 1}: #{task}"
      end
    end
  end
end

# ===CSVファイルに保存===
CSV.open("tasks.csv", "w") do |csv|
  tasks.each do |task|
    csv << [task]
  end
end


