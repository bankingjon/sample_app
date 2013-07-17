class AppealsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Appeals.count,
      iTotalDisplayRecords: campaign.appeals.total_entries,
      aaData: data
    }
  end

private

  def data
    @campaign = Campaign.find(params[:campaign_id])
    campaign.appeals.map do |appeal|
      [
          campaign.appeal.client_file_id,
          appeal.ask1,
          appeal.ask2,
          appeal.ask3,
          appeal.tier,
          appeal.tiercode,
          appeal.scanline,
          appeal.mailcode,
          appeal.mailtype,
      ]
    end
  end

  def appeals
    @appeals ||= fetch_appeals
  end

  def fetch_appeals
    appeals = campaign.appeals.order("#{sort_column} #{sort_direction}")
    appeals = campaign.appeals.page(page).per_page(per_page)
    if params[:sSearch].present?
      appeals = campaign.appeals.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    appeals
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end