module WillPaginate
  module ActionView
    class LinkRenderer < ViewHelpers::LinkRenderer
      def url(page)
        @base_url_params ||= begin
          url_params = base_url_params
          merge_optional_params(url_params)
          url_params
        end

        url_params = @base_url_params.dup
        add_current_page_param(url_params, page)

        @template.main_app.url_for(url_params)
      end
    end
  end
end
