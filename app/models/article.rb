class Article < ApplicationRecord
  # add constraint to :title which is presence: true  (no allowing empty title to save to DB)
  # enforce minimun letters by length: { minimun:_, maximun:_}
  validates :title, presence: true, length: { minimum:6, maximum:100 }
  validates :description, presence: true, length: { minimum:10, maximum:300 }
end