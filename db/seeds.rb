Message.create!(
    [
        {
            advice:  "自信を持ってナンパされにいきましょう",
            maximum: 100.00,
            minimum: 90.00
        },
        {
            advice:  "ほとんどの男性は見分けがつかないはず！",
            maximum: 89.99,
            minimum: 80.00
        },
        {
            advice:  "後ろから見たら女性にしか見えない！！",
            maximum: 79.99,
            minimum: 70.00
        },
        {
            advice:  "ナンパされるまでもう少し！",
            maximum: 69.99,
            minimum: 60.00
        },
        {
            advice:  "2人に1人はアナタのことを女性と見間違えるかも！",
            maximum: 59.99,
            minimum: 50.00
        },
        {
            advice:  "女装メイクは目が命！カラーコンタクトも試してみるのもオススメです！",
            maximum: 49.99,
            minimum: 40.00
        },
        {
            advice:  "女装メイクや写真の撮り方を工夫してましょう！",
            maximum: 39.99,
            minimum: 30.00
        },
        {
            advice:  "輪郭を誤魔化せるロングヘアーウィッグなどを試してみましょう！",
            maximum: 29.99,
            minimum: 20.00
        },
        {
            advice:  "イケメンな写真をアップロードしましたね・・？",
            maximum: 19.99,
            minimum: 10.00
        },
        {
            advice:  "おっと！アナタの写真はイケメン度合いが高いようです・・・",
            maximum: 9.99,
            minimum: 0.00
        },
    ]
)
User.create!(name: "管理者",
             email:  Rails.application.credentials.admin_user_email,
             password:               Rails.application.credentials.admin_user_password,
             password_confirmation:  Rails.application.credentials.admin_user_password,
             role: 1
)