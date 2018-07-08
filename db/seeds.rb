# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.create([{ email: "hoanhtung.xy@gmail.com", password: "123456!!"}])
category = Category.create([{ name: 'Kỹ thuật phần mềm'}]);
category = Category.create([{ name: 'Kinh doanh quốc tế'}]);
category = Category.create([{ name: 'Thiết kế đồ họa'}]);

subject = Subject.create([{ name: 'C++', category_id: 1}])
subject = Subject.create([{ name: 'C##', category_id: 1}])
subject = Subject.create([{ name: 'HCI', category_id: 1}])
subject = Subject.create([{ name: 'ACC', category_id: 2}])
subject = Subject.create([{ name: 'GUI', category_id: 3}])

for i in 0..5
    course = Course.create([{ name: "Chapter 0 #{i} C++", subject_id: 1 }])
end
for i in 0..5
    course = Course.create([{ name: "Chapter 0 #{i} C##", subject_id: 2 }])
end
for i in 0..5
    course = Course.create([{ name: "Chapter 0 #{i} HCI", subject_id: 3 }])
end
for i in 0..5
    course = Course.create([{ name: "Chapter 0 #{i} ACC", subject_id: 4 }])
end
for i in 0..5
    course = Course.create([{ name: "Chapter 0 #{i} GUI", subject_id: 5 }])
end
