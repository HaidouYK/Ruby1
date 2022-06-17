require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集)"

memo_type = gets.to_s
select_type = memo_type.chomp

if select_type == "1"
 puts "拡張子を除いたファイルを入力してください"
 
 file_name = gets.chomp
 
 p "メモしたい内容を記入してください"
 p "完了したらCtrl+Dをおします"
 
 contents = $stdin.read
 
 CSV.open("#{file_name}.csv" , "w") do |file|
   file << ["#{contents}"]

 end

elsif select_type == "2"
  puts "拡張子を除いたファイルを入力してください"
  
  file_name = gets.chomp
  
  CSV.open("#{file_name}.csv", "r") do |file|
  puts file.read
  
  end
  
  p "編集したい内容を記入してください"
  p "完了したらCtrl+Dをおします"
  
  contents = $stdin.read
  
  CSV.open("#{file_name}.csv" , "a") do |file|
   file << ["#{contents}"]
  
  end

else
  puts "エラー"

end