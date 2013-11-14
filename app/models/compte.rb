class Compte < ActiveRecord::Base
  attr_accessible :mois, :nom, :valeur, :nature
end
