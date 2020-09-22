require 'import'
START = "インポート処理を開始"

namespace :import_csv do
  desc "テキスト教材のCSVデータをインポートするタスク"

  task text_data: :environment do
    list = Import.csv_data(path:"db/csv_data/text_data.csv")

    puts START
    # インポートができなかった場合の例外処理
    begin
      Text.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end

  desc "動画教材のCSVデータをインポートするタスク"

  task movie_data: :environment do
    list = Import.csv_data(path:"db/csv_data/movie_data.csv")

    puts START
    # インポートができなかった場合の例外処理
    begin
      Movie.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end

end
