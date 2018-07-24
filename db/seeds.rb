# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.create([{ email: "hoanhtung.xy@gmail.com", password: "123456!!"}])

user = User.create([{ name: "Tung 1", email: "hoanhtung1@gmail.com", password: "123456!!"}])
user = User.create([{ name: "Tung 2", email: "hoanhtung2@gmail.com", password: "123456!!"}])
user = User.create([{ name: "Tung 3", email: "hoanhtung3@gmail.com", password: "123456!!"}])
user = User.create([{ name: "Tung 4", email: "hoanhtung4@gmail.com", password: "123456!!"}])
user = User.create([{ name: "Tung 5", email: "hoanhtung5@gmail.com", password: "123456!!"}])

category = Category.create([{ name: 'Lớp 1'}]);
category = Category.create([{ name: 'Lớp 2'}]);
category = Category.create([{ name: 'Lớp 3'}]);

subject = Subject.create([{ name: 'Toán', category_id: 1}])
subject = Subject.create([{ name: 'Tiếng việt', category_id: 1}])
subject = Subject.create([{ name: 'Chính tả', category_id: 2}])
subject = Subject.create([{ name: 'KH-XH', category_id: 2}])
subject = Subject.create([{ name: 'KH-XH', category_id: 3}])
subject = Subject.create([{ name: 'Tiếng anh', category_id: 3}])



for i in 0..3
    course = Course.create([{ name: "Phép cộng #{i}", subject_id: 1 }])
end
for i in 0..3
    course = Course.create([{ name: "Bảng chữ cái #{i}", subject_id: 2 }])
end
for i in 0..3
    course = Course.create([{ name: "Ngữ âm#{i}", subject_id: 3 }])
end
for i in 0..3
    course = Course.create([{ name: "Đời sống#{i}", subject_id: 4 }])
end
for i in 0..3
    course = Course.create([{ name: "Văn hóa#{i}", subject_id: 5 }])
end
for i in 0..3
    course = Course.create([{ name: "Số đếm #{i}", subject_id: 6 }])
end
