class GetCoursesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    GetCoursesJob.set(wait: 5.seconds).perform_later(SourceProvidersController.parse_all)
  end
end
