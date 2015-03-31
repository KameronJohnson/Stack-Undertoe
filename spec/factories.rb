FactoryGirl.define do
  factory :user do
  email('dog@world.com')
  password('12345678')
  end

  factory(:question) do
    title('test1 title')
    query('test1 query')
  end
end
