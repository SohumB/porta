module Liquid::Tags

  class PageSection < Liquid::Tags::Base
    example "Using page_section in liquid", %{
      <html>
        <body id="{% page_section %}" class="{% page_sub_section %}">
          <p class="notice">You are visiting applications/new, the id of the body will be 'applications'</p>
          <p class="notice">You are visiting applications/new, the class of the body will be 'new'</p>
        </body>
      </html>
    }

    desc "Returns the page section of the current url."
    def render(context)
      context.registers[:controller].controller_name
    end
  end

end

