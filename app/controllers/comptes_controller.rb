# encoding: UTF-8
class ComptesController < ApplicationController
  def index
    @comptes = Compte.where(true)
    @liste_virt = Compte.where(true).each.map{|cp| cp.valeur.to_f }
    # @liste2013 = Compte.where(mois: ("2013-01-01".."2013-12-31")).each.map{|cp| [cp.mois.to_time.to_i*1000, cp.valeur.to_f]}
    # @liste2012 = Compte.where(mois: ("2012-01-01".."2012-12-31")).each.map{|cp| [cp.mois.to_time.to_i*1000, cp.valeur.to_f]}
    @liste2014 = Compte.where(mois: ("2014-01-01".."2014-12-31")).each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2013 = Compte.where(mois: ("2013-01-01".."2013-12-31")).each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2012 = Compte.where(mois: ("2012-01-01".."2012-12-31")).each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
    @liste2011 = Compte.where(mois: ("2011-01-01".."2011-12-31")).each.map{|cp| [cp.mois.strftime("%b"), cp.valeur.to_f]}
  end

  def list
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
