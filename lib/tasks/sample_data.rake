namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_clients
    make_campaigns
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_clients
  5.times do
    name = Faker::Company.name
    Client.create!(name: name)
    @client = Client.last
    Campaign.create!(name: "White Mail", client_id: @client.id)
  end
end


def make_campaigns
  50.times do |n|
    client = rand(1..5)
    name = Faker::Company.catch_phrase
    date = "1/1/2013"
    Campaign.create!(name: name, drop_date: date, client_id: client)
    campaign = Campaign.last
    make_appeals(campaign)  
  end
end

def make_appeals(campaign)
  sample = 10
  response_rate = rand(2..100)/100.to_f
  total_gifts = sample * response_rate
  sample.times do
    donorid = rand(1000..99999) 
    mailcode = ('A'..'E').to_a.shuffle[0]+rand(1..9).to_s
    askone = rand(15..50)
    asktwo = rand(25..100)
    askthree = rand(35..250)
    tier = rand(1..10)
    tiercode = ('A'..'J').to_a.shuffle[0]+rand(1..9).to_s
    scanline = donorid.to_s+mailcode+tier.to_s+tiercode
    campaign.appeals.create!(
              client_file_id: donorid,
              ask1: askone,
              ask2: asktwo,
              ask3: askthree,
              mailcode: mailcode,
              scanline: scanline,
              tier: tier,
              tiercode: tiercode )
    appeal = Appeal.last
    if total_gifts > 0
      make_donations(donorid, scanline, appeal.id, campaign.client_id)
      total_gifts = total_gifts - 1
    end
  end
end


def make_donations(donorid, scanline, appeal_id, client)
  gift_id = rand(10000..99999)
  channel = "mail"
  amount = rand(5..1000)
  date = "1/1/2013"
  Donation.create(amount:  amount,
                  channel:  channel, 
                  client_file_id: donorid,
                  gift_date: date,
                  gift_id: gift_id,
                  scanline: scanline,
                  client_id: client,
                  appeal_id: appeal_id)
end











