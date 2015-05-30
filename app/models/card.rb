class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_one :guess

  def self.sample_card
     card = Card.all.sample(1)

    until card.first.guess == nil
      card = Card.all
      card.sample(1)
    end
    card
  end
end