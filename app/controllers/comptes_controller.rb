class ComptesController < ApplicationController
  def index
    @comptes = Compte.where(true)
    @liste_virt = Compte.where(true).each.map{|cp| cp.valeur.to_f }
   
    # @liste2013 = Compte.where(mois: ("2013-01-01".."2013-12-31")).each.map{|cp| [cp.mois.to_time.to_i*1000, cp.valeur.to_f]}
    # @liste2012 = Compte.where(mois: ("2012-01-01".."2012-12-31")).each.map{|cp| [cp.mois.to_time.to_i*1000, cp.valeur.to_f]}
  
     @liste2013 = Compte.where(mois: ("2013-01-01".."2013-12-31")).each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
     @liste2012 = Compte.where(mois: ("2012-01-01".."2012-12-31")).each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
  


  end
end
