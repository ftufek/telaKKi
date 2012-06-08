module ItemsHelper

  def vote_percentage(up, down)
    if up == 0
      if down == 0
        return 100
      end
      return 0
    end
    return up / (up+down)
  end

end
