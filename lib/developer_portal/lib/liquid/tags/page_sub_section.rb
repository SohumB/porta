module Liquid::Tags

  class PageSubSection < Liquid::Tags::Base
    nodoc!

    example "Using page_sub_section in liquid", %{
      <html>
        <body id="{% page_section %}" class="{% page_sub_section %}">
          <p class="notice">You are visiting application/new, the id of the body will be 'application'</p>
          <p class="notice">You are visiting application/new, the class of the body will be 'new'</p>
        </body>
      </html>
    }

    desc "Returns the page subsection of the current url."
    def render(context)
      context.registers[:controller].action_name
    end
  end

end
