# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories=[
            {level1:"レディース",level1_children:[
                                                {level2:"トップス",level2_children:["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ/ブラウス(半袖/袖なし)","シャツ/ブラウス(七分/長袖)","ポロシャツ","キャミソール","タンクトップ","ニット/セーター","チュニック","カーディガン/ボレロ","アンサンブル","ベスト/ジレ","パーカー","トレーナー/スウェット","ベアトップ/チューブトップ","ジャージ","その他"]},
                                                {level2:"ジャケット/アウター",level2_children:["テーラードジャケット","ノーカラージャケット","Gジャン/デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","ミリタリージャケット","ダウンベスト","ジャンパー/ブルゾン","ポンチョ","ロングコート","トレンチコート","ダッフルコート","ピーコート","チェスターコート","モッズコート","スタジャン","毛皮/ファーコート","スプリングコート","スカジャン","その他"]}
                                               ]
            },
            {level1:"メンズ",level1_children:[
                                                {level2:"トップス",level2_children:["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ","ポロシャツ","タンクトップ","ニット/セーター","カーディガン","ベスト","パーカー","スウェット","ジャージ","その他"]},
                                                {level2:"ジャケット/アウター",level2_children:["テーラードジャケット","ノーカラージャケット","Gジャン/デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","ミリタリージャケット","ダウンベスト","ジャンパー/ブルゾン","ポンチョ","ロングコート","トレンチコート","ダッフルコート","ピーコート","チェスターコート","モッズコート","スタジャン","毛皮/ファーコート","スプリングコート","スカジャン","その他"]}
                                               ]
            }
          ]

categories.each.with_index(1) do |category,i|
  level1_var="@category#{i}"                                                        #1階層の変数("@category1"等)
  level1_val= Category.create(name:"#{category[:level1]}")                          #1階層の値作成("カテゴリ　1"等)
  eval("#{level1_var} = level1_val")                                                #1階層の変数=1階層の値
    category[:level1_children].each.with_index(1) do |level1_child,j|
      level2_var="#{level1_var}_#{j}"                                               #2階層の変数("@category1-1"等)
      level2_val= eval("#{level1_var}.children.create(name:level1_child[:level2])") #2階層の値作成("カテゴリ　1-1"等)
      eval("#{level2_var} = level2_val")                                            #2階層の変数=2階層の値
        level1_child[:level2_children].each do |level2_children_val|
          eval("#{level2_var}.children.create(name:level2_children_val)")           #3階層の値作成("カテゴリ　1-1-1"等)
        end
    end
end