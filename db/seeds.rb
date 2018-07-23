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
category = Category.create([{ name: 'Lớp 4'}]);
category = Category.create([{ name: 'Lớp 5'}]);
category = Category.create([{ name: 'Lớp 6'}]);

subject = Subject.create([{ name: 'Đạo đức', category_id: 1}])
subject = Subject.create([{ name: 'Tiếng việt', category_id: 1}])
subject = Subject.create([{ name: 'Khoa học', category_id: 1}])
subject = Subject.create([{ name: 'Chính tả', category_id: 2}])
subject = Subject.create([{ name: 'KHXH', category_id: 2}])
subject = Subject.create([{ name: 'Vẽ', category_id: 2}])
subject = Subject.create([{ name: 'Tiếng việt', category_id: 3}])
subject = Subject.create([{ name: 'Địa lý', category_id: 4}])
subject = Subject.create([{ name: 'Lịch sử', category_id: 5}])
subject = Subject.create([{ name: 'Hình học', category_id: 6}])
subject = Subject.create([{ name: 'Đại số', category_id: 6}])


for i in 0..5
    course = Course.create([{ name: "Đạo đức 0#{i}", subject_id: 1 }])
end
for i in 0..5
    course = Course.create([{ name: "Tiếng việt 0#{i}", subject_id: 2 }])
end
for i in 0..5
    course = Course.create([{ name: "Khoa học 0#{i}", subject_id: 3 }])
end
for i in 0..5
    course = Course.create([{ name: "Chính tả 0#{i}", subject_id: 4 }])
end
for i in 0..5
    course = Course.create([{ name: "KHXH 0#{i}", subject_id: 5 }])
end
