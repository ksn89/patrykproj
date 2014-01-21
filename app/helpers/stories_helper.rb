module StoriesHelper
  def status_button(story)
    links = case story.status
              when 'Unstarted'
                [{
                     status: 'Started',
                     col: 'default'
                 }]
              when 'Started'
                [{
                     status: 'Finished',
                     col: 'primary'
                 }]
              when 'Finished'
                [{
                     status: 'Delivered',
                     col: 'warning'
                 }]
              when 'Delivered'
                [{
                     status: 'Accepted',
                     col: 'success'
                 },
                 {
                     status: 'Rejected',
                     col: 'danger'
                 }]
              when 'Rejected'
                [{
                     status: 'Unstarted',
                     col: 'default'
                 }]
            end
    links.each_with_object([]) do |link, obj|
      obj << link_to(link[:status], project_story_path(story.project, story, story: {status: link[:status]}), method: "put", :class => "btn btn-#{link[:col]}")

    end.join("").html_safe
  end
end
