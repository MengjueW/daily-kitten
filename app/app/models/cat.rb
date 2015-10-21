class Cat < ActiveRecord::Base
  searchkick
  extend Enumerize
  enumerize :sex, in: [:male, :female]
  enumerize :breed, in: [:abyssinian, :american_bobtail, :american_curl, :american_shorthair, :american_wirehair,
    :balinese, :bengal_cats, :birman, :bombay, :british_shorthair, :burmese, :burmilla,
    :chartreux, :chinese_li_hua, :colorpoint, :chorthair, :cornish_rex, :cymric,
    :devon_rex,
    :egyptian_mau, :european_burmese, :exotic,
    :havana_brown, :himalayan,
    :japanese_bobtail, :javanese,
    :korat,
    :laPerm,
    :maine_coon, :manx,
    :nebelung, :norwegian_forest,
    :ocicat, :others, :oriental,
    :persian,
    :ragamuffin, :ragdoll_cats, :russian_blue,
    :savannah, :scottish_fold, :selkirk_rex, :siamese_cat, :siberian, :singapura, :snowshoe, :somali, :sphynx,
    :tonkinese, :turkish_angora, :turkish_van]
  validates :age, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 30 }
  acts_as_votable
  has_many :comments
  has_many :pictures, :dependent => :destroy
end
