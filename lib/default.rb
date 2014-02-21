# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo


# Helper to filter pages by extension
def filter_page
  if item[:extension] == "md"
    filter :erb
    filter :kramdown
  else
    filter :haml
  end
end