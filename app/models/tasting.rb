class Tasting < ApplicationRecord
  belongs_to :user
  belongs_to :wine, optional: true

  mount_uploader :photo, PhotoUploader

  def palate_finish_desc
    if palate_finish <= 3
      return "courte"
    elsif palate_finish <= 5
      return "moyenne (-)"
    elsif palate_finish <= 7
      return "moyenne"
    elsif palate_finish <= 9
      return "moyenne (+)"
    else
      return "longue"
    end
  end

  def stars_rating(mark)
    if mark.nil?
      return nil
    else
      rating = mark/4
      full_stars = rating.to_i
      if rating - rating.to_i > 0.74
        full_stars += 1
        half_star = 0
      elsif rating - rating.to_i > 0.24
        half_star = 1
      else
        half_star = 0
      end
      empty_stars = 5 - full_stars - half_star
    end
    return [full_stars, half_star, empty_stars]
  end

  def body
    if self.palate_body.nil?
      return nil
    else
      body = self.palate_body
      case body
        when 1 then "Léger"
        when 2 then "Moyen (-)"
        when 3 then "Moyen"
        when 4 then "Moyen (+)"
        when 5 then "Puissant"
        else "Mauvaise réponse"
      end
    end
  end

  def general_mark
    ponderation = 0
    general_mark = 0
    complement = ""
    case readiness
      when "Trop jeune" then complement = "+"
      when "Peut être bu maintenant, mais potentiel de vieillissement" then complement = "+"
      when "Trop vieux" then complement = "-"
      else complement = ""
    end
    unless nose_quality.nil?
      ponderation += 15
      general_mark += nose_quality/4*3
    end
    unless palate_quality.nil?
      ponderation += 40
      general_mark += palate_quality*2
    end
    unless palate_finish.nil?
      ponderation += 20
      general_mark += palate_finish
    end
    unless balance.nil?
      ponderation += 25
      general_mark += balance*6/5
    end
    if general_mark == 0
      complement = " note"
    else
      general_mark = 100*general_mark/ponderation
    end
    return general_mark.to_s + complement
  end
end
