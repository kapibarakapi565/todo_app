require "csv"

# ===登録===
def register_tasks(tasks)
  puts "タスクを入力してください。\n終了したいときは「end」を入力してください。"

  loop do
    input = gets.chomp
    if input == "end"
      break
    end
    tasks.push(input)
  end
end

# ===一覧表示===
def show_tasks(tasks)
  puts "タスク一覧"
  tasks.each_with_index do |task, i|
    puts "#{i + 1}: #{task}"
  end
end

# ===削除===
def delete_tasks(tasks)
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
        show_tasks(tasks)
      end
    end
  end
end

# ===CSVファイルの読み込み===
def load_tasks_from_csv(tasks, file_path)
  if File.exist?(file_path)
    CSV.foreach(file_path) do |row|
      tasks << row[0]
    end
    show_tasks(tasks)
  end
end

# ===CSVファイルに保存===
def save_tasks_to_csv(tasks, file_path)
  CSV.open(file_path, "w") do |csv|
    tasks.each do |task|
      csv << [task]
    end
  end
end


tasks = []
file_path = "tasks.csv"
load_tasks_from_csv(tasks, file_path)

loop do
  puts "===メニュー==="
  puts "1. タスクを登録"
  puts "2. タスクを一覧表示"
  puts "3. タスクを削除"
  puts "0. アプリを終了"
  puts "番号を選択してください"

  input = gets.to_i

  case input
  when 1
    register_tasks(tasks)
  when 2
    show_tasks(tasks)
  when 3
    delete_tasks(tasks)
  when 0
    puts "アプリを終了します。"
    break
  else
    puts "無効な値です。"
  end
end

save_tasks_to_csv(tasks, file_path)








