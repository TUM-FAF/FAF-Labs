FactoryGirl.define do
  factory :user do
    email     'student@faf.md'
    password  'gagarin-mujik'
  end

  factory :course do
    name      "Software testing"
    summary   "A course about TDD"
    syllabus  "In this course we will see how to create factories. All the pros and cons"
  end
end
