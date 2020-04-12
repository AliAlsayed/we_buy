module DealsHelper
  def join_or_pull_out_button(deal, pledge)
    if @pledge 
      button_to "Pull out", offer_pledge_path(@deal, @pledge), method: :delete, data: {confirm: "Are you sure?"}, class: 'btn btn-primary' 
    else 
      button_to "Join The Group!", offer_pledges_path(@deal), class: 'btn btn-primary'
    end
  end
end
