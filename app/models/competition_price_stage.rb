class CompetitionPriceStage < ApplicationRecord
  belongs_to :competition, optional: true
end
