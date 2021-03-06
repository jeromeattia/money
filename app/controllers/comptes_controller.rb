# encoding: UTF-8
class ComptesController < ApplicationController
  def index
    #TODO: add a name item for finding by name
    @comptes = Compte.where(true)
    @liste_virt = Compte.where(true).each.map{|cp| cp.valeur.to_f }
    # @liste2013 = Compte.where(mois: ("2013-01-01".."2013-12-31")).each.map{|cp| [cp.mois.to_time.to_i*1000, cp.valeur.to_f]}
    # @liste2012 = Compte.where(mois: ("2012-01-01".."2012-12-31")).each.map{|cp| [cp.mois.to_time.to_i*1000, cp.valeur.to_f]}
    @liste2014  = Compte.where(mois: ("2014-01-01".."2014-12-31"), nature: "virement_mensuel").each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2013  = Compte.where(mois: ("2013-01-01".."2013-12-31"), nature: "virement_mensuel").each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2012  = Compte.where(mois: ("2012-01-01".."2012-12-31"), nature: "virement_mensuel").each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2011  = Compte.where(mois: ("2011-01-01".."2011-12-31"), nature: "virement_mensuel").each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2010  = Compte.where(mois: ("2010-01-01".."2010-12-31"), nature: "virement_mensuel").each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @ca_cabinet = Compte.where(nature: "CA_annuel").order("mois ASC").each.map{|cp| [cp.valeur.to_f]}
    @years      = Compte.where(nature: "CA_annuel").order("mois ASC").each.map{|cp| [cp.mois.strftime("%Y")]}.flatten 
    @charges_cabinet = []
    @ratio = []
    @years.each do |i|
      ca      = Compte.where("nature = 'CA_annuel' and EXTRACT(YEAR FROM mois) = '#{i}' " ).each.map{|cp| [cp.valeur.to_f]}
      charges = Compte.where("nature = 'charges_cabinet_annuel' and EXTRACT(YEAR FROM mois) = '#{i}'").each.map{|cp| [ - cp.valeur.to_f]}
      if charges.empty?
        @charges_cabinet << 0
        @ratio           << 0
      else
        @charges_cabinet << charges.flatten[0]
        @ratio           << (-(charges.flatten[0]/ca.flatten[0])*100).round(1) 
      end
    end
   end

  def list
    #TODO: sort by date
    @comptes = Compte.where(true)
  end

  def new
    @compte = Compte.new
  end
  
  def edit
    @compte = Compte.find(params[:id])
  end

  def update
    @compte = Compte.find(params[:id])

    respond_to do |format|
      if @compte.update_attributes(params[:compte])
        format.html { redirect_to(comptes_path, :notice => 'Comptes mis à jour.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end   

  def create
     @compte = Compte.new(params[:compte])

    respond_to do |format|
      if @compte.save
        format.html { redirect_to(new_compte_path, :notice => 'OK') }
        format.js
      else
        format.html { render :action => "new" }
        
      end
    end
  end

  def destroy
    @compte = Compte.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to(comptes_url) }
      format.js
    end
  end
end
