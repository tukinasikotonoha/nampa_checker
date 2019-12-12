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
            advice:  "70パーセント代です",
            maximum: 79.99,
            minimum: 70.00
        },
        {
            advice:  "60パーセント代です",
            maximum: 69.99,
            minimum: 60.00
        },
        {
            advice:  "50パーセント代です！",
            maximum: 59.99,
            minimum: 50.00
        },
        {
            advice:  "40パーセント代です！",
            maximum: 49.99,
            minimum: 40.00
        },
        {
            advice:  "30パーセント代です！",
            maximum: 39.99,
            minimum: 30.00
        },
        {
            advice:  "20パーセント代です！",
            maximum: 29.99,
            minimum: 20.00
        },
        {
            advice:  "10パーセント代です！",
            maximum: 19.99,
            minimum: 10.00
        },
        {
            advice:  "女装メイクや写真の撮り方を工夫してみましょう！",
            maximum: 9.99,
            minimum: 0.00
        },
    ]
)
User.create!(name: "管理者",
             email:  "admin@example.com",
             password:               "password",
             password_confirmation:  "password",
             role: 1
)