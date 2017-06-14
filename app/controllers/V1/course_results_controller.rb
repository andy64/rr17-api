class V1::CourseResultsController < ApiBaseController

  # GET /course_results
  def index
    render json: CourseResult.where('created_at >= ?', Time.zone.now.beginning_of_day)
  end

  # GET /course_results/history
  def show
    render json: CourseResult.last(10)
  end

end
